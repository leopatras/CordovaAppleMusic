IMPORT util
PUBLIC CONSTANT StatusNotDetermined = 0
PUBLIC CONSTANT StatusDenied= 1
PUBLIC CONSTANT StatusAuthorized = 2
PUBLIC CONSTANT StatusRestricted = 3
FUNCTION init()
  DEFINE result STRING
  CALL ui.Interface.frontCall("cordova","call",
                             ["AppleMusic","init"],[result])
END FUNCTION

FUNCTION getStatus() RETURNS INT
  DEFINE result INT
  CALL ui.Interface.frontCall("cordova","call",
                             ["AppleMusic","getStatus"],[result])
  RETURN result
END FUNCTION

FUNCTION requestAuthorization() RETURNS BOOLEAN
  DEFINE result BOOLEAN
  CALL ui.Interface.frontCall("cordova","call",
                             ["AppleMusic","requestAuthorization"],[result])
  RETURN result
END FUNCTION

FUNCTION playTrack(storeID STRING) RETURNS BOOLEAN
  DEFINE result BOOLEAN
  CALL ui.Interface.frontCall("cordova","call",
                             ["AppleMusic","playTrack",storeID],[result])
  RETURN result
END FUNCTION

FUNCTION playID(persistentID STRING) RETURNS BOOLEAN
  DEFINE result BOOLEAN
  CALL ui.Interface.frontCall("cordova","call",
                             ["AppleMusic","playID",persistentID],[result])
  RETURN result
END FUNCTION

FUNCTION getCountryCode() RETURNS STRING
  DEFINE result STRING
  CALL ui.Interface.frontCall("cordova","call",
                             ["AppleMusic","getCountryCode"],[result])
  RETURN result
END FUNCTION

FUNCTION getDuration() RETURNS INTERVAL HOUR TO SECOND
  DEFINE result STRING
  DEFINE duration FLOAT
  --we can't use a FLOAT directly, this may fail for german,french etc
  CALL ui.Interface.frontCall("cordova","call",
                             ["AppleMusic","getDuration"],[result])
  CALL util.JSON.parse(result,duration)
  RETURN duration --automatic conversion to INTERVAL
END FUNCTION

FUNCTION getPosition() RETURNS INTERVAL HOUR TO SECOND
  DEFINE result STRING
  DEFINE duration FLOAT
  CALL ui.Interface.frontCall("cordova","call",
                             ["AppleMusic","getPosition"],[result])
  CALL util.JSON.parse(result,duration)
  RETURN duration --automatic conversion to INTERVAL
END FUNCTION

FUNCTION createPlayList()
  DEFINE result STRING
  CALL ui.Interface.frontCall("cordova","call",
                             ["AppleMusic","createPlayList"],[result])
END FUNCTION

FUNCTION addSongtoPlayList()
  DEFINE result STRING
  CALL ui.Interface.frontCall("cordova","call",
                             ["AppleMusic","addSongtoPlayList"],[result])
END FUNCTION

FUNCTION getPlayLists()
  DEFINE result STRING
  CALL ui.Interface.frontCall("cordova","call",
                             ["AppleMusic","getPlayLists"],[result])
END FUNCTION

FUNCTION getSongs()
  DEFINE result STRING
  CALL ui.Interface.frontCall("cordova","call",
                             ["AppleMusic","getSongs"],[result])
END FUNCTION

FUNCTION resume()
  CALL ui.Interface.frontCall("cordova","call",
                             ["AppleMusic","resume"],[])
END FUNCTION

FUNCTION pause()
  CALL ui.Interface.frontCall("cordova","call",
                             ["AppleMusic","pause"],[])
END FUNCTION

FUNCTION stop()
  CALL ui.Interface.frontCall("cordova","call",
                             ["AppleMusic","stop"],[])
END FUNCTION

FUNCTION seek(seekpos INTERVAL HOUR TO SECOND)
  DEFINE val INTERVAL SECOND(5) TO SECOND
  LET val=seekpos
  CALL ui.Interface.frontCall("cordova","call",
                             ["AppleMusic","seek",val],[])
END FUNCTION
