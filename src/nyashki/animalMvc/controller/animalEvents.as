/**
 * Created by Ivan Shagarov
 * Orel city
 * Date: 28.11.13
 * Time: 10:19
 */
package nyashki.animalMvc.controller {

import flash.events.Event;

public class animalEvents extends BaseEvent  {





    public function animalEvents(type:String) {
        super(type);
    }


    override public function clone():Event {
        super.clone();

        var newEvent:animalEvents = new animalEvents(type);

        return newEvent;
    }
}
}



