require.config({baseUrl:"js/",paths:{jquery:"jquery-min"},map:{"*":{jquery:"jquery-private"},"jquery-private":{jquery:"jquery"}}}),require(["jquery"],function(){var e,r;return r=new Phoenix.Socket("ws://"+location.host+"/ws"),e={messages:[],racers:[],starting_locations:[[0,0],[0,1],[0,2]],mouse:[0,0],selected:[!1,0,0]},console.log(e.selected)});