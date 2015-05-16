command: "php server.widget/server.php"

refreshFrequency: 500000

style: """
  /* Modify Colors and Size Here:*/
  
  size = 200px                //This is just a base for the overall size so everything stays centered

  width: size   
  text-align: left

  height: 60px
  
  /*POSITION*/
  top: 55.9%
  left: 3.5%

  /*COLORS*/
  primaryColor = rgba(255,255,255,0.55)
  secondaryColor = rgba(0, 0, 0, 0.15)
  textColor = rgba(255,255,255,0.85)

  font-family: Helvetica
  font-weight: 300
  font-size: 16px

  #sicon
    float: left
    margin-right: 30px

  #stext
    float: left
    color: primaryColor
 
  #stxt
    color: primaryColor
    font-size: 13px

  img
    opacity: 0.7

  #sip
    color: primaryColor
    font-size: 13px    

  #serverbox
    padding: 15px 0px 15px 0px
    color: primaryColor
    
"""


render: (output) -> """
  <div id="serverbox">
    <div id="sicon"><img src="server.widget/server.png" width="35" height="33"></div>
    <div id="stext">
        <div id="stxt"></div>
        <div id="sip"></div>
    </div>
  </div>
"""


update: (output) ->  
  if output != ""
    json = JSON.parse(output); 
    $('#serverbox').show()
    $('#stxt').text json[0]['ip']+": "+json[0]['status']
    $('#sip').text json[1]['ip']+": "+json[1]['status']
  else
    $('#serverbox').hide()

