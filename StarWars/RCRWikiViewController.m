//
//  RCRWikiViewController.m
//  StarWars
//
//  Created by Ramón Carnero Rojo on 13/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRWikiViewController.h"
#import "RCRStarWarsUniverseViewController.h"

@implementation RCRWikiViewController

-(id) initWithModel:(RCRStarWarsCharacter*) model{
    
    if (self = [super initWithNibName:nil bundle:nil]){
        _model = model;
        self.title = @"Wikipedia";
    }
    
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //Alta en notificaciones
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(notifyThatCharacterDidChange:)
               name:CHARACTER_DID_CHANGE_NOTIFICATION_NAME
             object:nil];
    
    //Asignamos delegado
    self.browser.delegate = self;
    
    //sincronizar la vista
    [self syncViewWithModel];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //Baja en notificaciones
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

-(void) webViewDidFinishLoad:(UIWebView *)webView{
    
    //decirle al activityView que pare. Se ocultará sólo por haber marcado la opción
    [self.activityView stopAnimating];
    self.activityView.hidden = YES;
}

-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    //no podemos eliminarlo por completo porque es necesario cargar el link inicial
    if ((navigationType == UIWebViewNavigationTypeLinkClicked) || (navigationType == UIWebViewNavigationTypeFormSubmitted)){
        return NO;
    }
    
    return YES;
}

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    NSLog(@"Error de carga de la web");
    //cargar una página con mensaje de error
    
}

#pragma mark - Notifications
//CHARACTER_DID_CHANGE_NOTIFICATION_NAME
-(void)notifyThatCharacterDidChange:(NSNotification*)n{
    
    //Extraigo el personaje
    RCRStarWarsCharacter *newModel = [n.userInfo objectForKey:CHARACTER_KEY];
    
    //Cambiar mi modelo
    self.model = newModel;
    
    //Sincronizar vistas con el modelo nuevo
    [self syncViewWithModel];
}

#pragma mark - Utils

-(void) syncViewWithModel{
    
    //Mostrar el activiy
    self.activityView.hidden = NO;
    
    //Empezar la animación
    [self.activityView startAnimating];
    
    //Cargar la url
    NSURLRequest *r = [NSURLRequest requestWithURL:self.model.wikiPage];
    [self.browser loadRequest:r];
}

@end
