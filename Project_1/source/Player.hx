import flixel.math.FlxPoint;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import haxe.Log;
import flixel.group.FlxGroup.FlxTypedGroup;

class Player extends FlxSprite
{
    //private var playerColor:FlxColor;
    private var slots:FlxTypedGroup<Slot>;
    private var pieces:FlxTypedGroup<Piece>;
    private var player:Int;

	public function new(_player:Int ,x:Float = 0, y:Float = 0, _width:Int = 300, _height:Int = 100)
    {
        var _color:FlxColor;
        var _colorLight:FlxColor;
        var _colorDark:FlxColor;
        var _colorBackground:FlxColor;

        // super(x, y);
        super(x - Std.int(_width / 2), y - Std.int(_height / 2));

        this.player = _player;

		// Set the player Color
		switch _player
		{
			case 0:
                // Player one is Red
                _colorLight = FlxColor.fromHSB(0,1,1,1);
                _color = FlxColor.fromHSB(0,1,0.75,1);
                _colorDark = FlxColor.fromHSB(0,1,0.5,1);
                _colorBackground = FlxColor.fromHSB(0,1,0.25,1);
			case 1:
                // Player two is Blue
                _colorLight = FlxColor.fromHSB(240,1,1,1);
                _color = FlxColor.fromHSB(240,1,0.75,1);
                _colorDark = FlxColor.fromHSB(240,1,0.5,1);
                _colorBackground = FlxColor.fromHSB(240,1,0.25,1);
			case 2:
                // Player four is puple
                _colorLight = FlxColor.fromHSB(300,1,1,1);
                _color = FlxColor.fromHSB(300,1,0.75,1);
                _colorDark = FlxColor.fromHSB(300,1,0.5,1);
                _colorBackground = FlxColor.fromHSB(300,1,0.25,1);
			case 3:
                // Player three is green
                _colorLight = FlxColor.fromHSB(120,1,1,1);
                _color = FlxColor.fromHSB(120,1,0.75,1);
                _colorDark = FlxColor.fromHSB(120,1,0.5,1);
                _colorBackground = FlxColor.fromHSB(120,1,0.25,1);
			default:
				_color = FlxColor.WHITE;
                _colorLight = FlxColor.WHITE;
                _colorDark = FlxColor.WHITE;
                _colorBackground = FlxColor.WHITE;
		}

        // Replace this with FlxColor.TRANSPARENT or Board Graphic
        makeGraphic(_width,_height,_colorBackground);

        // Creat the game slots
        slots = new FlxTypedGroup<Slot>(3);
        slots.add(new Slot(this.getCenter().x - 100, this.getCenter().y));
        slots.add(new Slot(this.getCenter().x, this.getCenter().y));
        slots.add(new Slot(this.getCenter().x + 100, this.getCenter().y));


        pieces = new FlxTypedGroup<Piece>(9);
        // Create Large Pieces
        pieces.add(new Piece(2,_colorDark));
        pieces.add(new Piece(2,_colorDark));
        pieces.add(new Piece(2,_colorDark));

        pieces.add(new Piece(1,_color));
        pieces.add(new Piece(1,_color));
        pieces.add(new Piece(1,_color));

        pieces.add(new Piece(0,_colorLight));
        pieces.add(new Piece(0,_colorLight));
        pieces.add(new Piece(0,_colorLight));




        //pieces.members[0].setColor(_color);
        //pieces.members[1].setColor(_color);
        //pieces.members[2].setColor(_color);

        /*
        pieces.add(new Piece(0,this.player));
        pieces.add(new Piece(0,this.player));
        pieces.add(new Piece(0,this.player));




        pieces.members[3].setColor(FlxColor.WHITE);
        pieces.members[4].setColor(FlxColor.WHITE);
        pieces.members[5].setColor(FlxColor.WHITE);
        */

        for (i in 0...pieces.length)
        {
            pieces.members[i].setPosition(slots.members[i%3].getCenter().x,slots.members[i%3].getCenter().y);
        }
        //pieces.members[3].setPosition(slots.members[i].getCenter().x,slots.members[i].getCenter().y);
        /*
        for (i in 3...5)
        {
            pieces.members[i].setPosition(slots.members[i].getCenter().x,slots.members[i].getCenter().y);
        }
        //*/
    }
    public function getPieces():FlxTypedGroup<Piece>
    {
        return this.pieces;
    }

    public function getSlots():FlxTypedGroup<Slot>
    {
        return this.slots;
    }

    public function getCenter():FlxPoint
    {
        // Returns the center point of the player
        return new FlxPoint(this.x + Std.int(this.width/2),this.y + Std.int(this.height/2));
    }

    public override function setPosition(x:Float = 0.0, y:Float = 0.0) 
    {
        // Sets Position from center instead of the top right corner
        super.setPosition(x - Std.int(width / 2), y - Std.int(height / 2));
    }

    public function setAngle(_angle:Float)
    {
        // This is a terrible solution to rotation because it can only handle 90 and -90
        // But it works for now
        switch _angle
        {
            case 90:
                this.angle = _angle;
                slots.members[0].setPosition(this.getCenter().x, this.getCenter().y - 100);
                slots.members[2].setPosition(this.getCenter().x, this.getCenter().y + 100);

                pieces.members[0].setPosition(this.getCenter().x, this.getCenter().y - 100);
                pieces.members[2].setPosition(this.getCenter().x, this.getCenter().y + 100);

                pieces.members[3].setPosition(this.getCenter().x, this.getCenter().y - 100);
                pieces.members[5].setPosition(this.getCenter().x, this.getCenter().y + 100);

                pieces.members[6].setPosition(this.getCenter().x, this.getCenter().y - 100);
                pieces.members[8].setPosition(this.getCenter().x, this.getCenter().y + 100);
            case -90:
                this.angle = _angle;
                slots.members[0].setPosition(this.getCenter().x, this.getCenter().y - 100);
                slots.members[2].setPosition(this.getCenter().x, this.getCenter().y + 100);

                pieces.members[0].setPosition(this.getCenter().x, this.getCenter().y - 100);
                pieces.members[2].setPosition(this.getCenter().x, this.getCenter().y + 100);

                pieces.members[3].setPosition(this.getCenter().x, this.getCenter().y - 100);
                pieces.members[5].setPosition(this.getCenter().x, this.getCenter().y + 100);

                pieces.members[6].setPosition(this.getCenter().x, this.getCenter().y - 100);
                pieces.members[8].setPosition(this.getCenter().x, this.getCenter().y + 100);
            default:
                Log.trace("Error: Rotation Not handled");
        }
        //*/
        
    }
    
    public function setColor(_color:FlxColor)
    {
        this.color = _color;
    }

    public function getColor():FlxColor
    {
        return this.color;
    }

    public function startTurn()
    {
        Log.trace("Start Turn");

        // Unlock all Pieces
        for (i in 0...pieces.length)
        {
            pieces.members[i].setLocked(true);
        }
    }

	public function endTurn()
	{
		Log.trace("End Turn");

        // Lock all Pieces
        for (i in 0...pieces.length)
        {
            pieces.members[i].setLocked(false);
        }
	}
}
