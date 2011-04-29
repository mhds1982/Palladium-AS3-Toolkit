package com.matheushenrique.palladium
{

import com.matheushenrique.palladium.core.*;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.geom.Rectangle;
import flash.geom.Point;

/**
 * Palladium (Pd) AS3 Toolkit (http://pd.matheushenrique.com)
 * 
 * PdBitmap is an extremely fast, lightweight, and flexible. 
 * <b>Copyright 2010, Matheus Henrique. All rights reserved.</b>
 * 
 * @author Matheus Henrique dos Santos, contact@matheushenrique.com
 */

public class PdBitmap extends Object
{

    public static function toBitmapData(params:Object):BitmapData {
    	params.width = params.width || 100;
    	params.height = params.height || 100;	
    	
    	var bdContent:BitmapData = new BitmapData(params.width, params.height, true, 0x00000000);
    	bdContent.draw(params.movie);
    	
    	return bdContent;
    }
    
    public static function toSprite(params:Object):Sprite {
    	params.matrix = params.matrix || null;
    	params.repeat = params.repeat || false;
    	params.smooth = params.smooth || true;
    	
    	var mySprite:Sprite = new Sprite();
    	mySprite.graphics.beginBitmapFill(params.bitmap, params.matrix, params.repeat, params.smooth);
    	mySprite.graphics.drawRect(0, 0, params.bitmap.width, params.bitmap.height);
    	mySprite.graphics.endFill();
    	
    	return mySprite;
    }
    
    public static function cut(params:Object):BitmapData {
    	params.width = params.width || 100;
    	params.height = params.height || 100;
    	params.x = params.x || 0;
    	params.y = params.y || 0;
    	
    	var bmpReturn:BitmapData = new BitmapData(params.width,params.height,true);
    	var bmpRectangle:Rectangle = new Rectangle(params.x, params.y, params.width, params.height);
    	var bmpPoint:Point = new Point(0,0);
    	
    	bmpReturn.copyChannel(params.from, bmpRectangle, bmpPoint, 1, 1);
    	bmpReturn.copyChannel(params.from, bmpRectangle, bmpPoint, 2, 2);
    	bmpReturn.copyChannel(params.from, bmpRectangle, bmpPoint, 4, 4);
    	bmpReturn.copyChannel(params.from, bmpRectangle, bmpPoint, 8, 8);	
    	
    	return bmpReturn;
    }

}

}