/**
 * Created by Ivan Shagarov
 * Orel city
 * Date: 06.12.13
 * Time: 17:51
 */
package nyashki.commonModels {

import nyashki.commonModels.vo.gameDataCommonVO;
import nyashki.commonModels.vo.okDataCommonVO;
import nyashki.friendsMvc.model.vo.friendsDataVO;

public final class gameDataCommonProxy {

    // Модель данных игры
    private static var gameDCVO:gameDataCommonVO = gameDataCommonVO.getInstance();
    // Модель данных юзера в ОК
    private static var okDCVO:okDataCommonVO = okDataCommonVO.getInstance();

    // Синглтон паттерн + public final class
    private static var instance:gameDataCommonProxy = new gameDataCommonProxy();

    public static function getInstance():gameDataCommonProxy {

        return instance;

    }

    public function gameDataCommonProxy() {

        if( instance ) throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );

    }



    public function setGameInfo(data:Object, level:int = 0):Boolean {
        //data = JSON.decode(data.result);

        if (data is Object) {

            // Обнулить друзей чтобы не показывать тоже самое
            gameDCVO.levelFriends = null;
            gameDCVO.levelFriends = new Array();


            // Если есть друзья кто прошел уровень - пишем инфу по достижениям и дописываем из массива всех друзей фотку и имя для правой полосы.  иначе обнуляем массив прошедших

            /*
             //
             //  Воображаемые друзья для тестов
             //
             */


             staticGameInfo.levelFriends.push({fr_id:77777777, time:13, cur_level:15, achievs:12, cover:option2.cover, first_name:option2.first_name });
             staticGameInfo.levelFriends.push({fr_id:77777777, time:88, cur_level:10, achievs:12, cover:option2.cover, first_name:option2.first_name });
             staticGameInfo.levelFriends.push({fr_id:77777777, time:133, cur_level:20, achievs:12, cover:option2.cover, first_name:option2.first_name });



            //staticGameInfo.levelFriends.pop(); staticGameInfo.levelFriends.pop();staticGameInfo.levelFriends.pop();

            gameDCVO.levelFriends.sortOn("time", Array.NUMERIC);
            gameDCVO.totalLevels = data.result.t;
            gameDCVO.currentLevel = data.result.c;


        }

        return true;
    }



    public function setGameSettings(data:Object, level:int = 0):Boolean {

        //data = JSON.decode(data.result);

        var options:Object = data.result.o;
        //Console.log("options = ", options.DAYLOGIN);

        if(data is Object) {

            gameDCVO.GAME_FRIENDS.sortOn("friend_cur_level", Array.DESCENDING | Array.NUMERIC);



            // Настройки для общих значений
            //  "a":{"uc":2,"ufm":2,"ub":2,"ucd":0}
            gameDCVO.balance = data.result.a.ub;
            gameDCVO.currentLevel = data.result.a.uc;
            gameDCVO.start_money = options.START_MONEY.value;
            gameDCVO.giveDayloginBonus = data.result.d;
        }

        return true;
    }





}
}
