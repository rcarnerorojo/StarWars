//
//  RCRStarWarsUniverseViewController.m
//  StarWars
//
//  Created by Ramón Carnero Rojo on 14/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRStarWarsUniverseViewController.h"
#import "RCRStarWarsUniverse.h"
#import "RCRStarWarsCharacter.h"
#import "RCRCharacterViewController.h"

@interface RCRStarWarsUniverseViewController ()

@property (strong, nonatomic) RCRStarWarsUniverse *model;

@end

@implementation RCRStarWarsUniverseViewController

-(id) initWithModel:(RCRStarWarsUniverse *)model style:(UITableViewStyle)style{
    
    if (self = [super initWithStyle:style]){
        _model = model;
        self.title = @"Star Wars";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    if (section == IMPERIAL_SECTION){
        return [self.model imperialCount];
    }else{
        return [self.model rebelCount];
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == IMPERIAL_SECTION){
        return @"Empire";
    }else{
        return @"Rebel Alliance";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    //Reuse Id
    
    static NSString *cellId = @"StarWarsCell";
    
    // Averiguar de qué personaje me están hablando
    
    RCRStarWarsCharacter *character;
    if (indexPath.section == IMPERIAL_SECTION){
        character = [self.model imperialCharacterAtIndex:indexPath.row];
    }else{
        character = [self.model rebelCharacterAtIndex:indexPath.row];
    }
    
    //crear una celda (nos mandará una de la caché)
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil){//no hay celdas de este tipo en caché
        //tengo que crear la celda a pelo
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    //sincronizar modelo (personaje) -> vista (celda)
    cell.imageView.image = character.photo;
    cell.textLabel.text = character.alias;
    cell.detailTextLabel.text = character.name;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //averiguar de qué personaje se trata
    RCRStarWarsCharacter *character;
    
    if (indexPath.section == IMPERIAL_SECTION){
        character = [self.model imperialCharacterAtIndex:indexPath.row];
    }else{
        character = [self.model rebelCharacterAtIndex:indexPath.row];
    }
    
    //Notificar al delegado
    if ([self.delegate respondsToSelector:@selector(starWarsUniverseViewController:didSelectCharacter:)]){
        //Entiende el mensaje que le mando
        [self.delegate starWarsUniverseViewController:self
                                   didSelectCharacter:character];
    }
    
    //Enviamos una notificación
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    NSDictionary *info = @{CHARACTER_KEY : character};
    
    NSNotification *n = [[NSNotification alloc]initWithName:CHARACTER_DID_CHANGE_NOTIFICATION_NAME
                                                     object:self
                                                   userInfo:info];

    [nc postNotification:n];
}

#pragma mark - RCRStarWarsUniverseViewControllerDelegate

//Lo usamos cuando el dispositivo es un iPhone
-(void)starWarsUniverseViewController:(RCRStarWarsUniverseViewController *)uVC didSelectCharacter:(RCRStarWarsCharacter *)character{
    
    //Crear un CharacterVC
    RCRCharacterViewController *charVC = [[RCRCharacterViewController alloc]initWithModel:character];
    
    //Pushearlo
    [self.navigationController pushViewController:charVC animated:YES];
    
}

@end
