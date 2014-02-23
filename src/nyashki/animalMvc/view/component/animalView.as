/**
 * Created by Ivan Shagarov
 * Orel city
 * Date: 24.11.13
 * Time: 18:18
 */
package nyashki.animalMvc.view.component {


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;

import nyashki.animalMvc.controller.animalCommand;
import nyashki.animalMvc.controller.animalEvents;

import nyashki.animalMvc.model.animalDataProxy;
import nyashki.commonModels.animalDataCommonProxy;


public final class animalView extends Sprite {

    private static var instance:animalView = new animalView();

    private var animalDCommonProxy:animalDataCommonProxy =  animalDataCommonProxy.getInstance();
    private var animalCont:PhotoClean;
    private var faceCont:PhotoClean;
    private var photoName:String;

    public function animalView() {

        if( instance ) throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );

    }

    public function showAnimal(_animalName:String):PhotoClean {

        // Имя картинки
        photoName = _animalName;

        animalCont = new PhotoClean(361,420);

        return animalCont;
    }

    // Вставка лица через контейнер с подгрузкой битмапы из ресурсов
    public function showFace(params:Object):PhotoClean {

        var faceWidth:Number = params.rightX - params.leftX;
        var faceHeight:Number = params.bottomY - params.topY;

        faceCont = new PhotoClean(faceWidth,faceHeight);

        faceCont.resource = animalDCommonProxy.faceResource.bitmapData;

        faceCont.x = params.leftX - 3;
        faceCont.y = params.topY;

        return faceCont;
    }

    // Когда картинка загрузилась - добавляем ее в контейнер
    public function animalPicAddToCont(picture:Object):void {

        animalCont.resource = ((new picture[photoName]) as Bitmap).bitmapData;

    }

    public static function getInstance():animalView {

        return instance;

    }


}
}
