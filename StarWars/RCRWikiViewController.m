//
//  RCRWikiViewController.m
//  StarWars
//
//  Created by Ramón Carnero Rojo on 13/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRWikiViewController.h"

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
    
    //Asignamos delegado
    self.browser.delegate = self;
    
    //sincronizar la vista
    [self.browser loadRequest:[NSURLRequest requestWithURL:self.model.wikiPage]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

-(void) webViewDidFinishLoad:(UIWebView *)webView{
    
    //decirle al activityView que pare. Se ocultará sólo por haber marcado la opción
    [self.activityView stopAnimating];
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

@end
