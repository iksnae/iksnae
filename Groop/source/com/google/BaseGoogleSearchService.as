/**
 * BaseGoogleSearchServiceService.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */
package com.google
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import mx.controls.treeClasses.DefaultDataDescriptor;
	import mx.utils.ObjectUtil;
	import mx.utils.ObjectProxy;
	import mx.messaging.events.MessageFaultEvent;
	import mx.messaging.MessageResponder;
	import mx.messaging.messages.SOAPMessage;
	import mx.messaging.messages.ErrorMessage;
   	import mx.messaging.ChannelSet;
	import mx.messaging.channels.DirectHTTPChannel;
	import mx.rpc.*;
	import mx.rpc.events.*;
	import mx.rpc.soap.*;
	import mx.rpc.wsdl.*;
	import mx.rpc.xml.*;
	import mx.rpc.soap.types.*;
	import mx.collections.ArrayCollection;
	
	/**
	 * Base service implementation, extends the AbstractWebService and adds specific functionality for the selected WSDL
	 * It defines the options and properties for each of the WSDL's operations
	 */ 
	public class BaseGoogleSearchService extends AbstractWebService
    {
		private var results:Object;
		private var schemaMgr:SchemaManager;
		private var BaseGoogleSearchServiceService:WSDLService;
		private var BaseGoogleSearchServicePortType:WSDLPortType;
		private var BaseGoogleSearchServiceBinding:WSDLBinding;
		private var BaseGoogleSearchServicePort:WSDLPort;
		private var currentOperation:WSDLOperation;
		private var internal_schema:BaseGoogleSearchServiceSchema;
	
		/**
		 * Constructor for the base service, initializes all of the WSDL's properties
		 * @param [Optional] The LCDS destination (if available) to use to contact the server
		 * @param [Optional] The URL to the WSDL end-point
		 */
		public function BaseGoogleSearchService(destination:String=null, rootURL:String=null)
		{
			super(destination, rootURL);
			if(destination == null)
			{
				//no destination available; must set it to go directly to the target
				this.useProxy = false;
			}
			else
			{
				//specific destination requested; must set proxying to true
				this.useProxy = true;
			}
			
			if(rootURL != null)
			{
				this.endpointURI = rootURL;
			} 
			else 
			{
				this.endpointURI = null;
			}
			internal_schema = new BaseGoogleSearchServiceSchema();
			schemaMgr = new SchemaManager();
			for(var i:int;i<internal_schema.schemas.length;i++)
			{
				internal_schema.schemas[i].targetNamespace=internal_schema.targetNamespaces[i];
				schemaMgr.addSchema(internal_schema.schemas[i]);
			}
BaseGoogleSearchServiceService = new WSDLService("BaseGoogleSearchServiceService");
			BaseGoogleSearchServicePort = new WSDLPort("BaseGoogleSearchServicePort",BaseGoogleSearchServiceService);
        	BaseGoogleSearchServiceBinding = new WSDLBinding("BaseGoogleSearchServiceBinding");
	        BaseGoogleSearchServicePortType = new WSDLPortType("BaseGoogleSearchServicePortType");
       		BaseGoogleSearchServiceBinding.portType = BaseGoogleSearchServicePortType;
       		BaseGoogleSearchServicePort.binding = BaseGoogleSearchServiceBinding;
       		BaseGoogleSearchServiceService.addPort(BaseGoogleSearchServicePort);
       		BaseGoogleSearchServicePort.endpointURI = "http://api.google.com/search/beta2";
       		if(this.endpointURI == null)
       		{
       			this.endpointURI = BaseGoogleSearchServicePort.endpointURI; 
       		} 
       		
			var requestMessage:WSDLMessage;
			var responseMessage:WSDLMessage;
			//define the WSDLOperation: new WSDLOperation(methodName)
            var doGetCachedPage:WSDLOperation = new WSDLOperation("doGetCachedPage");
				//input message for the operation
    	        requestMessage = new WSDLMessage("doGetCachedPage");
            				requestMessage.addPart(new WSDLMessagePart(new QName("","key"),null,new QName("http://www.w3.org/2001/XMLSchema","string")));
            				requestMessage.addPart(new WSDLMessagePart(new QName("","url"),null,new QName("http://www.w3.org/2001/XMLSchema","string")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="urn:GoogleSearch";
			requestMessage.encoding.useStyle="encoded";
                
                responseMessage = new WSDLMessage("doGetCachedPageResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("","return"),null,new QName("http://www.w3.org/2001/XMLSchema","base64Binary")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="urn:GoogleSearch";
                responseMessage.encoding.useStyle="encoded";				
				doGetCachedPage.inputMessage = requestMessage;
	        doGetCachedPage.outputMessage = responseMessage;
            doGetCachedPage.schemaManager = this.schemaMgr;
            doGetCachedPage.soapAction = "urn:GoogleSearchAction";
            doGetCachedPage.style = "rpc";
            BaseGoogleSearchServiceService.getPort("BaseGoogleSearchServicePort").binding.portType.addOperation(doGetCachedPage);
			//define the WSDLOperation: new WSDLOperation(methodName)
            var doSpellingSuggestion:WSDLOperation = new WSDLOperation("doSpellingSuggestion");
				//input message for the operation
    	        requestMessage = new WSDLMessage("doSpellingSuggestion");
            				requestMessage.addPart(new WSDLMessagePart(new QName("","key"),null,new QName("http://www.w3.org/2001/XMLSchema","string")));
            				requestMessage.addPart(new WSDLMessagePart(new QName("","phrase"),null,new QName("http://www.w3.org/2001/XMLSchema","string")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="urn:GoogleSearch";
			requestMessage.encoding.useStyle="encoded";
                
                responseMessage = new WSDLMessage("doSpellingSuggestionResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("","return"),null,new QName("http://www.w3.org/2001/XMLSchema","string")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="urn:GoogleSearch";
                responseMessage.encoding.useStyle="encoded";				
				doSpellingSuggestion.inputMessage = requestMessage;
	        doSpellingSuggestion.outputMessage = responseMessage;
            doSpellingSuggestion.schemaManager = this.schemaMgr;
            doSpellingSuggestion.soapAction = "urn:GoogleSearchAction";
            doSpellingSuggestion.style = "rpc";
            BaseGoogleSearchServiceService.getPort("BaseGoogleSearchServicePort").binding.portType.addOperation(doSpellingSuggestion);
			//define the WSDLOperation: new WSDLOperation(methodName)
            var doGoogleSearch:WSDLOperation = new WSDLOperation("doGoogleSearch");
				//input message for the operation
    	        requestMessage = new WSDLMessage("doGoogleSearch");
            				requestMessage.addPart(new WSDLMessagePart(new QName("","filter"),null,new QName("http://www.w3.org/2001/XMLSchema","boolean")));
            				requestMessage.addPart(new WSDLMessagePart(new QName("","key"),null,new QName("http://www.w3.org/2001/XMLSchema","string")));
            				requestMessage.addPart(new WSDLMessagePart(new QName("","restrict"),null,new QName("http://www.w3.org/2001/XMLSchema","string")));
            				requestMessage.addPart(new WSDLMessagePart(new QName("","start"),null,new QName("http://www.w3.org/2001/XMLSchema","int")));
            				requestMessage.addPart(new WSDLMessagePart(new QName("","ie"),null,new QName("http://www.w3.org/2001/XMLSchema","string")));
            				requestMessage.addPart(new WSDLMessagePart(new QName("","safeSearch"),null,new QName("http://www.w3.org/2001/XMLSchema","boolean")));
            				requestMessage.addPart(new WSDLMessagePart(new QName("","lr"),null,new QName("http://www.w3.org/2001/XMLSchema","string")));
            				requestMessage.addPart(new WSDLMessagePart(new QName("","maxResults"),null,new QName("http://www.w3.org/2001/XMLSchema","int")));
            				requestMessage.addPart(new WSDLMessagePart(new QName("","oe"),null,new QName("http://www.w3.org/2001/XMLSchema","string")));
            				requestMessage.addPart(new WSDLMessagePart(new QName("","q"),null,new QName("http://www.w3.org/2001/XMLSchema","string")));
                requestMessage.encoding = new WSDLEncoding();
                requestMessage.encoding.namespaceURI="urn:GoogleSearch";
			requestMessage.encoding.useStyle="encoded";
                
                responseMessage = new WSDLMessage("doGoogleSearchResponse");
            				responseMessage.addPart(new WSDLMessagePart(new QName("","return"),null,new QName("urn:GoogleSearch","GoogleSearchResult")));
                responseMessage.encoding = new WSDLEncoding();
                responseMessage.encoding.namespaceURI="urn:GoogleSearch";
                responseMessage.encoding.useStyle="encoded";				
				doGoogleSearch.inputMessage = requestMessage;
	        doGoogleSearch.outputMessage = responseMessage;
            doGoogleSearch.schemaManager = this.schemaMgr;
            doGoogleSearch.soapAction = "urn:GoogleSearchAction";
            doGoogleSearch.style = "rpc";
            BaseGoogleSearchServiceService.getPort("BaseGoogleSearchServicePort").binding.portType.addOperation(doGoogleSearch);
							SchemaTypeRegistry.getInstance().registerCollectionClass(new QName("urn:GoogleSearch","DirectoryCategoryArray"),com.google.DirectoryCategoryArray);
							SchemaTypeRegistry.getInstance().registerCollectionClass(new QName("urn:GoogleSearch","ResultElementArray"),com.google.ResultElementArray);
							SchemaTypeRegistry.getInstance().registerClass(new QName("urn:GoogleSearch","GoogleSearchResult"),com.google.GoogleSearchResult);
							SchemaTypeRegistry.getInstance().registerClass(new QName("urn:GoogleSearch","ResultElement"),com.google.ResultElement);
							SchemaTypeRegistry.getInstance().registerClass(new QName("urn:GoogleSearch","DirectoryCategory"),com.google.DirectoryCategory);
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param key* @param url
		 * @return Asynchronous token
		 */
		public function doGetCachedPage(key:String,url:String):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["key"] = key;
	            out["url"] = url;
	            currentOperation = BaseGoogleSearchServiceService.getPort("BaseGoogleSearchServicePort").binding.portType.getOperation("doGetCachedPage");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param key* @param phrase
		 * @return Asynchronous token
		 */
		public function doSpellingSuggestion(key:String,phrase:String):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["key"] = key;
	            out["phrase"] = phrase;
	            currentOperation = BaseGoogleSearchServiceService.getPort("BaseGoogleSearchServicePort").binding.portType.getOperation("doSpellingSuggestion");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
		/**
		 * Performs the low level call to the server for the operation
		 * It passes along the headers and the operation arguments
		 * @param filter* @param key* @param restrict* @param start* @param ie* @param safeSearch* @param lr* @param maxResults* @param oe* @param q
		 * @return Asynchronous token
		 */
		public function doGoogleSearch(filter:Boolean,key:String,restrict:String,start:Number,ie:String,safeSearch:Boolean,lr:String,maxResults:Number,oe:String,q:String):AsyncToken
		{
			var headerArray:Array = new Array();
            var out:Object = new Object();
            out["filter"] = filter;
	            out["key"] = key;
	            out["restrict"] = restrict;
	            out["start"] = start;
	            out["ie"] = ie;
	            out["safeSearch"] = safeSearch;
	            out["lr"] = lr;
	            out["maxResults"] = maxResults;
	            out["oe"] = oe;
	            out["q"] = q;
	            currentOperation = BaseGoogleSearchServiceService.getPort("BaseGoogleSearchServicePort").binding.portType.getOperation("doGoogleSearch");
            var pc:PendingCall = new PendingCall(out,headerArray);
            call(currentOperation,out,pc.token,pc.headers);
            return pc.token;
		}
        /**
         * Performs the actual call to the remove server
         * It SOAP-encodes the message using the schema and WSDL operation options set above and then calls the server using 
         * an async invoker
         * It also registers internal event handlers for the result / fault cases
         * @private
         */
        private function call(operation:WSDLOperation,args:Object,token:AsyncToken,headers:Array=null):void
        {
	    	var enc:SOAPEncoder = new SOAPEncoder();
	        var soap:Object = new Object;
	        var message:SOAPMessage = new SOAPMessage();
	        enc.wsdlOperation = operation;
	        soap = enc.encodeRequest(args,headers);
	        message.setSOAPAction(operation.soapAction);
	        message.body = soap.toString();
	        message.url=endpointURI;
            var inv:AsyncRequest = new AsyncRequest();
            inv.destination = super.destination;
            //we need this to handle multiple asynchronous calls 
            var wrappedData:Object = new Object();
            wrappedData.operation = currentOperation;
            wrappedData.returnToken = token;
            if(!this.useProxy)
            {
            	var dcs:ChannelSet = new ChannelSet();	
	        	dcs.addChannel(new DirectHTTPChannel("direct_http_channel"));
            	inv.channelSet = dcs;
            }                
            var processRes:AsyncResponder = new AsyncResponder(processResult,faultResult,wrappedData);
            inv.invoke(message,processRes);
		}
        
        /**
         * Internal event handler to process a successful operation call from the server
         * The result is decoded using the schema and operation settings and then the events get passed on to the actual facade that the user employs in the application 
         * @private
         */
		private function processResult(result:Object,wrappedData:Object):void
           {
           		var headers:Object;
           		var token:AsyncToken = wrappedData.returnToken;
                var currentOperation:WSDLOperation = wrappedData.operation;
                var decoder:SOAPDecoder = new SOAPDecoder();
                decoder.resultFormat = "object";
                decoder.headerFormat = "object";
                decoder.multiplePartsFormat = "object";
                decoder.ignoreWhitespace = true;
                decoder.makeObjectsBindable=false;
                decoder.wsdlOperation = currentOperation;
                decoder.schemaManager = currentOperation.schemaManager;
                var body:Object = result.message.body;
                var stringResult:String = String(body);
                if(stringResult == null  || stringResult == "")
                	return;
                var soapResult:SOAPResult = decoder.decodeResponse(result.message.body);
                if(soapResult.isFault)
                {
	                var faults:Array = soapResult.result as Array;
	                for each (var soapFault:Fault in faults)
	                {
		                var soapFaultEvent:FaultEvent = FaultEvent.createEvent(soapFault,token,null);
		                token.dispatchEvent(soapFaultEvent);
	                }
                } else {
	                result = soapResult.result;
	                headers = soapResult.headers;
	                var event:ResultEvent = ResultEvent.createEvent(result,token,null);
	                event.headers = headers;
	                token.dispatchEvent(event);
                }
           }
           	/**
           	 * Handles the cases when there are errors calling the operation on the server
           	 * This is not the case for SOAP faults, which is handled by the SOAP decoder in the result handler
           	 * but more critical errors, like network outage or the impossibility to connect to the server
           	 * The fault is dispatched upwards to the facade so that the user can do something meaningful 
           	 * @private
           	 */
			private function faultResult(error:MessageFaultEvent,token:Object):void
			{
				//when there is a network error the token is actually the wrappedData object from above	
				if(!(token is AsyncToken))
					token = token.returnToken;
				token.dispatchEvent(new FaultEvent(FaultEvent.FAULT,true,true,new Fault(error.faultCode,error.faultString,error.faultDetail)));
			}
		}
	}

	import mx.rpc.AsyncToken;
	import mx.rpc.AsyncResponder;
	import mx.rpc.wsdl.WSDLBinding;
                
    /**
     * Internal class to handle multiple operation call scheduling
     * It allows us to pass data about the operation being encoded / decoded to and from the SOAP encoder / decoder units. 
     * @private
     */
    class PendingCall
    {
		public var args:*;
		public var headers:Array;
		public var token:AsyncToken;
		
		public function PendingCall(args:Object, headers:Array=null)
		{
			this.args = args;
			this.headers = headers;
			this.token = new AsyncToken(null);
		}
	}