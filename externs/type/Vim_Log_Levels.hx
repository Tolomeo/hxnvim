package externs.type;

extern enum abstract Vim_Log_Levels(Float) from Float to Float {
	var WARN = "3";
	var TRACE = "0";
	var OFF = "5";
	var INFO = "2";
	var ERROR = "4";
	var DEBUG = "1";
}