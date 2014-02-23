/**
 * Created by Ivan Shagarov
 * Orel city
 * Date: 24.11.13
 * Time: 18:17
 */
package nyashki.commonModels.vo{

import flash.display.Bitmap;

public final class animalDataCommonVO {



    public var userPhotoFileToLoadLink:String = "";
    public var userBigPhoto:Object;
    public var currentAnimalWithParams:Object;
    public var faceResource:Bitmap;
    public var animalNamesWithParams:Array = new Array();

    public var soundEnable:Boolean = false;

    public var currentToolTip:Array = new Array();
    public var animalFileToLoad:String;
    public var image:Object;
    public var id:String = "";
    public var caption:String = "";
    public var cover:String = "";
    public var src:String = "";
    public var genDialogLock:Boolean = false;
    public var width:int = 0;
    public var height:int = 0;
    public var x:int = 0;
    public var y:int = 0;
    public var w:int = 0;
    public var h:int = 0;
    public var r:int = 0;

    // Синглтон паттерн + public final class
    private static var instance:animalDataCommonVO = new animalDataCommonVO();

    public static function getInstance():animalDataCommonVO {

        return instance;

    }

    public function animalDataCommonVO(data:Object = null) {
        super(data);

        if( instance ) throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );

        if(data && (data is Object)) {
            data = data || {};

            soundEnable = data.hasOwnProperty("soundEnable") ? data.soundEnable : false;
            genDialogLock = data.hasOwnProperty("genDialogLock") ? data.genDialogLock : false;
            currentAnimalWithParams = data.hasOwnProperty("currentAnimalWithParams") ? data.currentAnimalWithParams : {};
            currentToolTip =  data.hasOwnProperty("currentToolTip") ? data.currentToolTip : [{}];
            userPhotoFileToLoadLink = data.hasOwnProperty("userPhotoFileToLoadLink") ? data.userPhotoFileToLoadLink : "";
            animalNamesWithParams =  data.hasOwnProperty("animalNamesWithParams") ? data.animalNamesWithParams : [{}];
            animalFileToLoad = data.hasOwnProperty("animalFileToLoad") ? data.animalFileToLoad : "";
            image = data.hasOwnProperty("image") ? data.image : {};
            userBigPhoto = data.hasOwnProperty("userBigPhoto") ? data.userBigPhoto : {};
            faceResource = data.hasOwnProperty("faceResource") ? data.faceResource : null;
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
