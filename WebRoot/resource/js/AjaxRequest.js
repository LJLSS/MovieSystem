/**
 * 
 */
var net =new Object();
net.AjaxRequest = function(url, onload, onerror, method, params){
	this.req= null;
	this.onload= onload;
	this.onerror= (onerror)? onerror: this.defaultError;
	this.loadDate(url, method, params);
}

//init XMLHttpRequest Object,Return ResponseText

net.AjaxRequest.prototype.loadDate = function(url, method, params) {
	if(!method){
		method= "GET";
	}
	if(window.XMLHttpRequest){
		this.req = new XMLHttpRequest();
	}else if(window.ActiveXObject){
		this.req = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if(this.req){
		try{
			var loader = this;
			this.req.onreadystatechange = function(){
				net.AjaxRequest.onReadyState.call(loader);
			}
			this.req.open(method, url, false);
			if(method == "POST"){
				this.req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded charset=utf-8");
			}
			this.req.send(params);
		}catch(err){
			this.onerror.call(this);
		}
	}
}

//Status
net.AjaxRequest.onReadyState = function(){
	var req = this.req;
	var ready = req.readyState;
	if(ready == 4){
		if(req.status == 200){
			this.onload.call(this);
		}else{
			this.onerror.call(this);
		}
	}
} 

//ERROR
net.AjaxRequest.prototype.defaultError = function(){
	alert("ERROR Data\n\nRUN Status："+this.req.readyState+"\n Status："+this.req.status);
}

