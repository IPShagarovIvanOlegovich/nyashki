/**
 * Created by Ivan Shagarov
 * Orel city
 * Date: 06.12.13
 * Time: 17:51
 */
package nyashki.commonModels {

import nyashki.commonCommand.commonCommand;
import nyashki.commonCommand.commonEvents;
import nyashki.commonModels.vo.moodDataCommonVO;
import nyashki.moodMvc.model.vo.moodDataVO;

public final class moodDataCommonProxy {

    private var commonComm:commonCommand =  commonCommand.getInstance();

     // переменная с моделью данных
    private var moodCommonDVO:moodDataCommonVO = moodDataCommonVO.getInstance();

    // Синглтон паттерн + public final class
    private static var instance:moodDataCommonProxy = new moodDataCommonProxy();

    public static function getInstance():moodDataCommonProxy {

        return instance;

    }

    public function moodDataCommonProxy() {

        if( instance ) throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );

    }


}
}
