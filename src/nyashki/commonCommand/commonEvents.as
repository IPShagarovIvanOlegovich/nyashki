/**
 * Created by Ivan Shagarov
 * Orel city
 * Date: 28.11.13
 * Time: 10:19
 */
package nyashki.commonCommand {
 

public class commonEvents {

    // Список всех событий внутри животного
    public static const LOADANIMALPIC:String = "commonEvents:LOADANIMALPIC";
    public static const ANIMALPICLOADED:String = "commonEvents:ANIMALPICLOADED";
    public static const LOADANIMALLISTTOSELECT:String = "commonEvents:LOADANIMALLISTTOSELECT";
    public static const ANIMALLISTTOSELECTREADY:String = "commonEvents:ANIMALLISTTOSELECTREADY";
    public static const FACECHANGEREQUEST:String = "commonEvents:FACECHANGEREQUEST";
    public static const ANIMALCHANGEREQUEST:String = "commonEvents:ANIMALCHANGEREQUEST";
    public static const LOADUSERBIGPHOTO:String = "commonEvents:LOADUSERBIGPHOTO";
    public static const USERBIGPHOTOLOADED:String = "commonEvents:USERBIGPHOTOLOADED";

    public static const BALANCECHANGED:String = "commonEvents:BALANCECHANGED";
    public static const APIDATALOADED:String = "commonEvents:APIDATALOADED";

    public static const INVITEFRIEND:String = "commonEvents:INVITEFRIEND";

    public static const VSTATUS:String = "commonEvents:VSTATUS";
    public static const VSTATUSDIALOGCONFIRMED:String = "commonEvents:VSTATUSDIALOGCONFIRMED";

    public static const TOWALL:String = "commonEvents:TOWALL";
    public static const TOWALLDIALOGCONFIRMED:String = "commonEvents:TOWALLDIALOGCONFIRMED";

    public static const ANIMALFACADEGIVEANIMAL:String = "commonEvents:ANIMALFACADEGIVEANIMAL";
    public static const ANIMALFACADEANIMALREADY:String = "commonEvents:ANIMALFACADEANIMALREADY";


    public static const ANIMALMOODUPDATEREQUEST:String = "commonEvents:ANIMALMOODUPDATEREQUEST";

    public static const FACEADDDELAYHINT:String = "commonEvents:FACEADDDELAYHINT";
    public static const FACEADDDELAYHINTCLOSED:String = "commonEvents:FACEADDDELAYHINTCLOSED";
    public static const FACADEFACEADDDELAYHINTCLOSED:String = "commonEvents:FACADEFACEADDDELAYHINTCLOSED";

    public static const FACEADDDELAYHINTLEFTMENU:String = "commonEvents:FACEADDDELAYHINTLEFTMENU";
    public static const FACEADDDELAYHINTLEFTMENUCLOSED:String = "commonEvents:FACEADDDELAYHINTLEFTMENUCLOSED";
    public static const FACADEFACEADDDELAYHINTLEFTMENUCLOSED:String = "commonEvents:FACADEFACEADDDELAYHINTLEFTMENUCLOSED";


    public static const FACEADDDELAYHINTMOOD:String = "commonEvents:FACEADDDELAYHINTMOOD";
    public static const FACEADDDELAYHINTMOODCLOSED:String = "commonEvents:FACEADDDELAYHINTMOODCLOSED";
    public static const FACADEFACEADDDELAYHINTMOODCLOSED:String = "commonEvents:FACADEFACEADDDELAYHINTMOODCLOSED";


    public static const GENDIALOGCLOSED:String = "commonEvents:GENDIALOGCLOSED";

    public static const GIVEACTIONREACTION:String = "commonEvents:GIVEACTIONREACTION";




    public function commonEvents(type:String) {
        super(type);
    }


    override public function clone():Event {
        super.clone();

        var newEvent:commonEvents = new commonEvents(type);

        return newEvent;
    }
}
}



