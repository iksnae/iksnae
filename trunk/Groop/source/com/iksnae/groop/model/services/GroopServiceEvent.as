package com.iksnae.groop.model.services
{
	public class GroopServiceEvent
	{
		public function GroopServiceEvent()
		{
		}
		static public const CONNECTION_OPEN:String = 'on_connection_open';
		static public const CONNECTION_CLOSE:String = 'on_connection_close';
		static public const CONNECTION_SUCCESS:String = 'on_connection_success';
		static public const CONNECTION_FAIL:String = 'on_connection_fail';

	}
}