/**
 * Created by Ivan Shagarov
 * Orel city
 * Date: 24.11.13
 * Time: 18:17
 */
package nyashki.commonModels.vo{

public final class gameDataCommonVO {



    public var balance:int;
    public var totalLevels:int;
    public var currentLevel:int;

    public var start_money:int;
    public var giveDayloginBonus:Boolean;
    public var balanceButtonClick:String;
    public var levelFriends:Array = new Array();

    /**
     * Друзья в игре
     */
    public var GAME_FRIENDS:Array = new Array();



    // Синглтон паттерн + public final class
    private static var instance:gameDataCommonVO = new gameDataCommonVO();

    public static function getInstance():gameDataCommonVO {

        return instance;

    }

    public function gameDataCommonVO(data:Object = null) {
        super(data);

        if( instance ) throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );

        if(data && (data is Object)) {
            data = data || {};


            balance = data.hasOwnProperty("balance") ? data.balance : 0;
            totalLevels = data.hasOwnProperty("totalLevels") ? data.totalLevels : 0;
            currentLevel = data.hasOwnProperty("currentLevel") ? data.currentLevel : 0;
            GAME_FRIENDS = data.hasOwnProperty("GAME_FRIENDS") ? data.GAME_FRIENDS : [{}];
            start_money = data.hasOwnProperty("start_money") ? data.start_money : 0;
            giveDayloginBonus = data.hasOwnProperty("giveDayloginBonus") ? data.giveDayloginBonus : false;
            balanceButtonClick = data.hasOwnProperty("balanceButtonClick") ? data.balanceButtonClick : "";
            levelFriends = data.hasOwnProperty("levelFriends") ? data.levelFriends : [{}];



        }
    }


}
}
