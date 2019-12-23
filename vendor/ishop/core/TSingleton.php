<?php


namespace ishop;


trait TSingleton
{
    private static $instanse;

    public static function instanse()
    {
        if( self::$instanse === null ) {
            self::$instanse = new self;
        }
        return self::$instanse;
    }
}