/**
 * Created by Ivan Shagarov
 * Orel city
 * Date: 06.12.13
 * Time: 17:53
 */
package nyashki.commonModels.vo {


public final class moodDataCommonVO {

    public var actionsWithParams:Array = new Array();
    public var currentAction:String = "";


    // Синглтон паттерн + public final class
    private static var instance:moodDataCommonVO = new moodDataCommonVO();

    public static function getInstance():moodDataCommonVO {

        return instance;

    }


    public function moodDataCommonVO(data:Object = null) {
        super(data);

        if( instance ) throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );

        if(data && (data is Object)) {
            data = data || {};

            actionsWithParams =  data.hasOwnProperty("actionsWithParams") ? data.actionsWithParams : [{}];
            currentAction =  data.hasOwnProperty("currentAction") ? data.currentAction : "";
        }

    }
}
}
