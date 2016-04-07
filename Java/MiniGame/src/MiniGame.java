package TestingGame;

import java.io.*;
import java.util.Arrays;
//import org.apache.commons.lang3.ArrayUtils;

public class MiniGame {

    public static void main(String[] args){

        ObjectClass.buildBattleBoard();

        char[][] tempBattleBoard = new char[10][10];

        //ObjectName[] ArrayName = new ObjectName[4];

        ObjectClass[] Monsters = new ObjectClass[4];

        //public ObjectClass (int health, int attack, int movement, String name)

        Monsters[0] = new ObjectClass(1000, 40, 1, "Peos");
        Monsters[1] = new ObjectClass(250, 1, 1, "Mpogla");
        Monsters[2] = new ObjectClass(2000, 20, 1, "Kyr Leuteris");
        Monsters[3] = new ObjectClass(1000, 20, 5, "Mana sou");

        ObjectClass.reDrawBoard();

        for (ObjectClass m : Monsters ){
            if(m.getAlive()){
                int arrayItemIndex = Str.indexOf(Monsters, m);
                m.moveMonster(Monsters, arrayItemIndex);

            }
        }

         ObjectClass.reDrawBoard();

    }


}
