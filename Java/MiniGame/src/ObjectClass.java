//Used with either MiniGame.java or ObjectClassMain.java
package TestingGame;

import java.util.Arrays;

public class ObjectClass {

    static char[][] battleBoard = new char [10][10];

    public static void buildBattleBoard(){

        for(char[] row : battleBoard){

            Arrays.fill(row, '*');
        }
    }

    public static void reDrawBoard(){

        int k = 1;
        while(k <= 30){

            System.out.print('-');
            k++;
        }

        System.out.println();

        for (int i=0; i < battleBoard.length; i++){
            for(int j=0; j < battleBoard[i].length; j++){
                System.out.print("|" + battleBoard[i][j] + "|");
            }
            System.out.println();
        }

        k = 1;
        while(k <= 30){

            System.out.print('-');
            k++;
        }

        System.out.print('\n');

    }

    public final String TOMBSTONE = "Here lies someone dead";

    private int health = 500;
    private int attack = 20;
    private int movement = 2;

    private boolean alive = true;

    public int xPosition = 0;
    public int yPosition = 0;
    public static int numOfMonsters = 0;

    public char nameChar1 = 'B';
    public String name = "Big Monstro";

    //Constractor that wants input values
    public ObjectClass (int health, int attack, int movement, String name){

        this.health = health;
        this.attack = attack;
        this.movement = movement;
        this.name = name;

        int maxXBoardSpace = battleBoard.length - 1;
        int maxYBoardSpace = battleBoard[0].length - 1;

        int randNumX, randNumY;

        do {

            randNumX = (int)(Math.random() * maxXBoardSpace);
            randNumY = (int)(Math.random() * maxYBoardSpace);
        } while(battleBoard[randNumX][randNumY] != '*');

        this.xPosition = randNumX;
        this.yPosition = randNumY;
        this.nameChar1 = this.name.charAt(0);

        battleBoard[this.yPosition][this.xPosition] = this.nameChar1;

        numOfMonsters++;
    }

    //Constractor that doesnt want input otherwise Default if you dont define any
    public ObjectClass ( ){
        numOfMonsters++;
    }

    public int getAttack () {
        return( attack );
    }

    public int getMovement () {
        return( movement );
    }

    public int getHealth () {
        return( health );
    }

    public boolean getAlive(){
        return(alive);
    }

    public int setHealth (int decreaseHealth){

        health = health - decreaseHealth;
        if (health < 0){
            alive = false;
            return ( -1 );
        } else {
            return (health);
        }
    }

    // Overloaded method in case of wrong attribiute
    public int setHealth (double decreaseHealth){

        int intDecreaseHealth = (int) decreaseHealth;
        health = health - intDecreaseHealth;
        if (health < 0){
            alive = false;
            return ( -1 );
        } else {
            return (health);
        }

    }

    public void printMessages(int distance, int direction){

        switch (direction){
            case 0:{
                System.out.println("Monster " + this.nameChar1 + " heads " + distance + " blocks away to the North");
                break;
            }
            case 1:{
                System.out.println("Monster " + this.nameChar1 + " heads " + distance + " blocks away to the East");
                break;
            }
            case 2:{
                System.out.println("Monster " + this.nameChar1 + " heads " + distance + " blocks away to the South");
                break;
            }
            case 3:{
                System.out.println("Monster " + this.nameChar1 + " heads " + distance + " blocks away to the West");
                break;
            }
        }

    }

    public void moveMonster(ObjectClass[] monster, int arrayItemIndex){

        boolean isSpaceOpen = true;

        int maxXBoardSpace = battleBoard.length - 1;
        int maxYBoardSpace = battleBoard[0].length - 1;

        while(isSpaceOpen){

            int randMoveDirection = (int)(Math.random() * 4);
            int randMoveDistance = (int)(Math.random() * (this.getMovement() + 1) );

            printMessages(randMoveDistance, randMoveDirection);
            //System.out.println(this.nameChar1 + " " + randMoveDistance + " to " + randMoveDirection);

            battleBoard[this.yPosition][this.xPosition] = '*';

            //North movment
            if(randMoveDirection == 0){

                if((this.yPosition - randMoveDistance) < 0){

                    this.yPosition = 0;
                } else {
                    this.yPosition = this.yPosition - randMoveDistance;
                }
            //East movmet
            } else if(randMoveDirection == 1){

                if((this.xPosition + randMoveDistance) > maxXBoardSpace){

                    this.xPosition = maxXBoardSpace;
                } else {
                    this.xPosition = xPosition + randMoveDistance;
                }
            //South movment
            } else if(randMoveDirection == 2){

                if((this.yPosition + randMoveDistance) > maxYBoardSpace){

                    this.yPosition = maxYBoardSpace;
                } else {
                    this.yPosition = this.yPosition + randMoveDistance;
                }
            //West movment
            } else if(randMoveDirection == 3){

                if((this.xPosition - randMoveDistance) < 0){

                    this.xPosition = maxXBoardSpace;
                } else {
                    this.xPosition = this.xPosition - randMoveDistance;
                }
            }

            for(int i=0; i < monster.length; i++){
                //Dont check monster in itself
                if(i == arrayItemIndex){

                    continue;
                }

                if(onMySpace(monster, i, arrayItemIndex)){

                    isSpaceOpen = true;
                    break;
                } else {
                    isSpaceOpen = false;
                }
            }
        }// End of While loop

        battleBoard[this.yPosition][this.xPosition] = this.nameChar1;
    }//End of moveMonster method

    public boolean onMySpace(ObjectClass[] monster, int indexToCheck, int indexToCheck2){

        if((monster[indexToCheck].xPosition) == (monster[indexToCheck2].xPosition)){
            if((monster[indexToCheck].yPosition) == (monster[indexToCheck2].yPosition)){
                return (true);
            }

            return (false);
        }

        return (false);
    }


}
