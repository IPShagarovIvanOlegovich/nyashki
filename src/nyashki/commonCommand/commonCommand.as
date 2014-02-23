package nyashki.commonCommand {

import flash.display.Sprite;


public final class commonCommand extends Sprite {

    // Синглтон паттерн + public final class
    private static var instance:commonCommand = new commonCommand();




    public static function getInstance():commonCommand {

        return instance;

    }

    public function commonCommand() {

        if( instance ) throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );

    }




}
}
