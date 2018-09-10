#include <stdio.h>
#include "movment.h"

// Function: choose actions and perform said action
extern void choose_actions();

// Function: parse rules, limits, story, timeline base and general layout 
extern void parse_text();

// Function: generate game rules based on simple rules and form universe limits
extern void generate_rules();

// Function: genrate game timeline based in game rules and story 
extern void generate_timeline();

// Function: generate rooms based on generated rules and timeline base 
// e.x. the timeline will be the same but loot, NPCs, clues, events and notes 
// are customized based on general layout, limits and the above mentioned
extern void generate_rooms();

// Function: create a characther which may or may not impact the story or 
// the available actions, dialog and general attribouts 
extern void create_character();

int main( int argc, char **argv) {
    

    choose_actions(); 

    return 0;
}


