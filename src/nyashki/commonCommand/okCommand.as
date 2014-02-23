/**
 * Created by Ivan Shagarov
 * Orel city
 * Date: 18.12.13
 * Time: 21:29
 */
package nyashki.commonCommand {
 
import models.ModelContent;
import models.ModelUser;
import nyashki.commonModels.gameDataCommonProxy;
import nyashki.commonModels.okDataCommonProxy;
import nyashki.commonModels.vo.gameDataCommonVO;
import nyashki.commonModels.vo.okDataCommonVO;
import nyashki.commonTools.messageCommonDialog;

public final class okCommand extends Sprite {

    private var allFriendsStr:String = "";
 
    private static var commonComm:commonCommand = commonCommand.getInstance();

    // Модель данных игры
    private static var gameDCVO:gameDataCommonVO = gameDataCommonVO.getInstance();

    // Прокси для работы с моделью данных игры
    private static var gameDCProxy:gameDataCommonProxy = gameDataCommonProxy.getInstance();

    // Модель данных юзера в ОК
    private static  var okDCVO:Object = okDataCommonVO.getInstance();

    // Прокси юзера в ОК для синхронизации с сервером
    private static  var okDCProxy:Object = okDataCommonProxy.getInstance();

    // Экземпляр общего диалога
    private static var commonDialogV:messageCommonDialog = messageCommonDialog.getInstance();

    // Синглтон паттерн + public final class
    private static var instance:okCommand = new okCommand();

    public static function getInstance():okCommand {

        return instance;

    }

    public function okCommand() {

        if( instance ) throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );

        // Слушаем запрос на публикацию в статус
        commonComm.addEventListener(commonEvents.VSTATUS, setStatus_Handler);

        // Слушаем запрос на пост на стену
        commonComm.addEventListener(commonEvents.TOWALL, eventTOWALL_Handler);

        // Слушаем запрос на приглашение друга
        commonComm.addEventListener(commonEvents.INVITEFRIEND, inviteFriend_Handler);

    }

}
}
