package nyashki.animalMvc.model {

import nyashki.animalMvc.controller.animalCommand;
import nyashki.animalMvc.controller.animalEvents;
import nyashki.animalMvc.model.vo.animalDataVO;
import nyashki.commonCommand.commonCommand;


public final class animalDataProxy {

    private static var instance:animalDataProxy = new animalDataProxy();
    private var animalComm:animalCommand =  animalCommand.getInstance();
    private var animalVO:animalDataVO = animalDataVO.getInstance();


    public function animalDataProxy():void {

        if( instance ) throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );

    }

    public static function getInstance():animalDataProxy {

        return instance;

    }


}
}
