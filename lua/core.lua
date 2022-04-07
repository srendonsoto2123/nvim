--local req = require( "utils.error_handler" ).init( require )

--req:start( "settings" ):expect( "Ha ocurrido un error\nRevisar: " )
--req:start( "mapping" ):expect( "Ha ocurrido un error\nRevisar: " )

require( "settings" )
require( "mapping" )
