/**
 * Created by Ivan Shagarov
 * Orel city
 * Date: 18.12.13
 * Time: 21:29
 */
package nyashki.commonModels {

import nyashki.commonCommand.commonCommand;

import nyashki.commonCommand.commonEvents;
import nyashki.commonModels.vo.gameDataCommonVO;
import nyashki.commonModels.vo.okDataCommonVO;
import nyashki.friendsMvc.model.vo.friendsDataVO;
import com.adobe.serialization.json.JSON;
import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.net.URLRequestMethod;
import flash.net.URLVariables;


public final class okDataCommonProxy {
    private var okDCVO:Object = okDataCommonVO.getInstance();

    // Для уведомления главного файла nyashki о том что данные из ОК готовы к показу
    private static var commonComm:commonCommand = commonCommand.getInstance();

    // Экземпляр общего прокси для общих данных
    private var animalDCommonProxy:animalDataCommonProxy = animalDataCommonProxy.getInstance();

    // Синглтон паттерн + public final class
    private static var instance:okDataCommonProxy = new okDataCommonProxy();
    public static function getInstance():okDataCommonProxy {
        return instance;
    }

    public function okDataCommonProxy() {
        if( instance ) throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );
    }

 

}
}
