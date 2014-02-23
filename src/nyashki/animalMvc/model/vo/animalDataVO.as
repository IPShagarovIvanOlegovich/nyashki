/**
 * Created by Ivan Shagarov
 * Orel city
 * Date: 24.11.13
 * Time: 18:17
 */
package nyashki.animalMvc.model.vo{

public final class animalDataVO extends Sprite{


    public var id:String = "";
    public var caption:String = "";
    public var cover:String = "";
    public var src:String = "";
    public var width:int = 0;
    public var height:int = 0;
    public var x:int = 0;
    public var y:int = 0;
    public var w:int = 0;
    public var h:int = 0;
    public var r:int = 0;

    // Синглтон паттерн + public final class
    private static var instance:animalDataVO = new animalDataVO();

    public static function getInstance():animalDataVO {

        return instance;

    }

    public function animalDataVO(data:Object = null) {
        super(data);

        if( instance ) throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );

        if(data && (data is Object)) {
            data = data || {};

            id = data.hasOwnProperty("id") ? data.id : "";
            caption = data.hasOwnProperty("caption") ? data.caption : "";
            cover = data.hasOwnProperty("cover") ? data.cover : "";
            src = data.hasOwnProperty("src") ? data.src : "";
            width = data.hasOwnProperty("width") ? data.width : 0;
            height = data.hasOwnProperty("height") ? data.height : 0;
            x = data.hasOwnProperty("x") ? data.x : 0;
            y = data.hasOwnProperty("y") ? data.y : 0;
            w = data.hasOwnProperty("w") ? data.w : 0;
            h = data.hasOwnProperty("h") ? data.h : 0;
            r = data.hasOwnProperty("r") ? data.r : 0;

        }
    }


}
}
