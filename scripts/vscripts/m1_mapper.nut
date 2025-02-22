

// sName<-"";
// sSteam<-"";
// local mappercount = 0;

// function CheckConnected()
// {
// 	player<-null;
// 	while((player = Entities.FindByClassname(player,"player")) != null){
// 		if (player.GetNetworkIDString()== "STEAM_1:1:425871785"&&mappercount == 0){ //改成自己的steamid
// 		    AnnounceMapper();
// 			mappercount++;
// 		}
// 	}
// }

// function AnnounceMapper()
// {
// 	sName=player.GetPlayerName();
// 	sSteam=player.GetNetworkIDString();
// 	Say(null,"***欢迎地图作者:"+sName+" ***",false);
// 	Say(null,"****"+sSteam+"****",false);
// }