import QtQuick 2.12
import QtQuick.Controls 2.12
import "../"
import "Funcs.js" as JS

Rectangle {
    id: r
    color: apps.backgroundColor
    //visible: false
    property string jsonNum: ''
    property var aDes: ['dato1', 'dato2', 'dato3', 'dato4', 'dato5', 'dato6', 'dato7', 'dato8', 'dato9']

    property var currentDate
    property int currentNum: 0

    property color borderColor: apps.fontColor
    property int borderWidth: app.fs*0.15
    property int dir: -1
    property int uRot: 0

    //Número total de la fecha de nacimiento
    property int currentNumNacimiento: -1

    //Numero total de Nombre
    property int currentNumNombre: -1

    //Numero de suma de vocales de nombre
    property int currentNumNombreInt: -1

    //Numero de suma de consonantes de nombre
    property int currentNumNombreExt: -1

    //Número total de nacimiento y nombre
    property int currentNumDestino: -1

    //Numero de suma de letras de firma
    property int currentNumFirma: -1

    //Pinaculos
    property int currentPin1: -1
    property int currentPin2: -1
    property int currentPin3: -1
    property int currentPin4: -1

    property int currentNumPersonalidad: -1
    property int currentNumAnioPersonal: -1
    property bool esMaestro: false

    onCurrentNumNacimientoChanged: {
        calcularPersonalidad()
    }
    onCurrentNumNombreChanged: {
        calcularPersonalidad()
    }
    onCurrentNumAnioPersonalChanged: {
        currentNum=currentNumAnioPersonal-1
    }
    onCurrentDateChanged: {
        let d = currentDate.getDate()
        let m = currentDate.getMonth() + 1
        let a = currentDate.getFullYear()
        let f = d + '/' + m + '/' + a
        let aGetNums=JS.getNums(f)
        currentNumNacimiento=aGetNums[0]
        //txtDataDia.text=d
    }
    MouseArea{
        anchors.fill: parent
    }
    Flickable{
        id: flk
        anchors.fill: r
        contentWidth: r.width
        contentHeight: col1.height*1.5
        Column{
            id: col1
            spacing: app.fs*0.5
            Rectangle{
                id: xForm
                width: r.width-app.fs*0.5
                height: col2.height
                color: 'transparent'
                anchors.horizontalCenter: parent.horizontalCenter
                Column{
                    id: col2
                    spacing: app.fs*0.25
                    Rectangle{
                        id: xFN
                        width: xForm.width
                        height: colFN.height+app.fs
                        color: 'transparent'
                        border.width: 2
                        border.color: apps.fontColor
                        radius: app.fs*0.2
                        Column{
                            id: colFN
                            spacing: app.fs*0.5
                            anchors.centerIn: parent
                            Row{
                                spacing: app.fs*0.25
                                Text{
                                    id: labelFN
                                    text: '<b>Fecha de Nacimiento:</b>'
                                    color: apps.fontColor
                                    font.pixelSize: app.fs*0.5
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Rectangle{
                                    id:xTiFecha
                                    width: xForm.width-labelFN.width-app.fs
                                    height: app.fs*1.2
                                    color: apps.backgroundColor
                                    border.width: 2
                                    border.color: apps.fontColor
                                    anchors.verticalCenter: parent.verticalCenter
                                    TextInput {
                                        id: txtDataSearchFecha
                                        text: apps.uFecha
                                        font.pixelSize: app.fs*0.5
                                        width: parent.width-app.fs*0.2
                                        wrapMode: Text.WordWrap
                                        color: apps.fontColor
                                        focus: true
                                        //inputMask: '00.00.0000'
                                        anchors.centerIn: parent
                                        Keys.onReturnPressed: {
                                            if(text==='')return
                                            //panelLog.l(getNumNomText(text))
                                        }
                                        onTextChanged: {
                                            //setNumNac()
//                                            let mfecha=text.split('.')
//                                            if(!mfecha[0]||!mfecha[1]||!mfecha[2]||mfecha[2].length<4){
//                                                f0.text=''
//                                                currentNumNacimiento=-1
//                                                return
//                                            }
//                                            let d=mfecha[0]
//                                            let m=mfecha[1]
//                                            let a = mfecha[2]
//                                            let sf=''+d+'/'+m+'/'+a
//                                            let aGetNums=JS.getNums(sf)
//                                            currentNumNacimiento=aGetNums[0]
//                                            let dateP = new Date(parseInt(txtDataSearchFechaAP.text), m - 1, d, 0, 1)
//                                            //controlTimeYear.currentDate=dateP
//                                            r.currentDate = dateP
//                                            let msfd=(''+d).split('')
//                                            let sfd=''+msfd[0]
//                                            if(msfd.length>1){
//                                                sfd +='+'+msfd[1]
//                                            }
//                                            let msfm=(''+m).split('')
//                                            let sfm=''+msfm[0]
//                                            if(msfm.length>1){
//                                                sfm +='+'+msfm[1]
//                                            }
//                                            //let msform=(''+a).split('')
//                                            let msfa=(''+a).split('')
//                                            let sfa=''+msfa[0]
//                                            if(msfa.length>1){
//                                                sfa +='+'+msfa[1]
//                                            }
//                                            if(msfa.length>2){
//                                                sfa +='+'+msfa[2]
//                                            }
//                                            if(msfa.length>3){
//                                                sfa +='+'+msfa[3]
//                                            }
//                                            let sform= sfd + '+' + sfm + '+' + sfa//msform[0] + '+' + msform[1] + '+'  + msform[2]+ '+'  + msform[3]
//                                            let sum=0
//                                            let mSum=sform.split('+')
//                                            for(var i=0;i<mSum.length;i++){
//                                                sum+=parseInt(mSum[i])
//                                            }
//                                            let mCheckSum=(''+sum).split('')
//                                            if(mCheckSum.length>1){
//                                                if(sum===11||sum===22||sum===33){
//                                                    //r.esMaestro=true
//                                                }
//                                                let dobleDigSum=parseInt(mCheckSum[0])+parseInt(mCheckSum[1])
//                                                sform+='='+sum+'='+dobleDigSum
//                                                let mCheckSum2=(''+dobleDigSum).split('')
//                                                if(mCheckSum2.length>1){
//                                                    let dobleDigSum2=parseInt(mCheckSum2[0])+parseInt(mCheckSum2[1])
//                                                    sform+='='+dobleDigSum2
//                                                    currentNumNacimiento=dobleDigSum2
//                                                }else{
//                                                    currentNumNacimiento=dobleDigSum
//                                                }

//                                            }else{
//                                                currentNumNacimiento=sum
//                                            }
//                                            f0.text=sform
//                                            apps.uFecha=txtDataSearchFecha.text
//                                            calcularAP()
                                        }
                                        onFocusChanged: {
                                            if(focus)selectAll()
                                        }
                                        Rectangle{
                                            width: parent.width+app.fs
                                            height: parent.height+app.fs
                                            color: 'transparent'
                                            //border.width: 2
                                            //border.color: 'white'
                                            z: parent.z-1
                                            anchors.centerIn: parent
                                        }
                                    }
                                }
                            }

                            Text{
                                id: labelFNTS
                                text: r.currentDate?r.currentDate.toString():''
                                color: apps.fontColor
                                font.pixelSize: app.fs*0.25
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Text{
                                id: f0
                                color: apps.fontColor
                                font.pixelSize: app.fs*0.8
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Row{
                                spacing: app.fs*0.5
                                anchors.horizontalCenter:  parent.horizontalCenter
                                Text{
                                    text: '<b>N° Karma</b>: '
                                    color: apps.fontColor
                                    font.pixelSize: app.fs*0.5
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Rectangle{
                                    id: xNumKarma
                                    width: app.fs*2
                                    height: width
                                    radius: width*0.5
                                    border.width: app.fs*0.2
                                    border.color: apps.fontColor
                                    //rotation: 360-parent.rotation
                                    color: apps.backgroundColor
                                    anchors.verticalCenter: parent.verticalCenter
                                    Text{
                                        text: '<b>'+r.currentNumNacimiento+'</b>'
                                        font.pixelSize: parent.width*0.8
                                        color: apps.fontColor
                                        anchors.centerIn: parent
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Rectangle{
                id: xFormNom
                width: xForm.width
                height: colNom.height+app.fs
                color: 'transparent'
                border.width: 2
                border.color: apps.fontColor
                radius: app.fs*0.2
                Column{
                    id: colNom
                    spacing: app.fs*0.75
                    anchors.centerIn: parent
                    Text{
                        text: '<b>Calcular Nombre</b>'
                        color: apps.fontColor
                        font.pixelSize: app.fs*0.5
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Rectangle{
                        id:xTiNombre
                        width: xForm.width-app.fs*0.5
                        height: app.fs*1.2
                        color: apps.backgroundColor
                        border.width: 2
                        border.color: apps.fontColor
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{
                            text: '<b>Nombre:</b>'
                            color: apps.fontColor
                            font.pixelSize: app.fs*0.25
                            anchors.bottom: parent.top
                            anchors.bottomMargin: app.fs*0.25
                        }
                        TextInput {
                            id: txtDataSearchNom
                            text: apps.uNom
                            font.pixelSize: app.fs*0.5
                            width: parent.width-app.fs*0.2
                            wrapMode: Text.WordWrap
                            color: apps.fontColor
                            focus: false
                            anchors.centerIn: parent
                            Keys.onReturnPressed: {
                                if(text==='')return
                                //panelLog.l(getNumNomText(text))
                                apps.uNom=text
                            }
                            onTextChanged: {
                                //panelLog.l(getNumNomText(text))
                                apps.uNom=text
                            }
                            onFocusChanged: {
                                if(focus)selectAll()
                            }
                            Rectangle{
                                width: parent.width+app.fs
                                height: parent.height+app.fs
                                color: 'transparent'
                                //border.width: 2
                                //border.color: 'white'
                                z: parent.z-1
                                anchors.centerIn: parent
                            }
                        }
                    }
                    Rectangle{
                        id:xTiFirma
                        width: xForm.width-app.fs*0.5
                        height: app.fs*1.2
                        color: apps.backgroundColor
                        border.width: 2
                        border.color: apps.fontColor
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{
                            text: '<b>Firma:</b>'
                            color: apps.fontColor
                            font.pixelSize: app.fs*0.25
                            anchors.bottom: parent.top
                            anchors.bottomMargin: app.fs*0.25
                        }
                        TextInput {
                            id: txtDataSearchFirma
                            text: apps.uFirma
                            font.pixelSize: app.fs*0.5
                            width: parent.width-app.fs*0.2
                            wrapMode: Text.WordWrap
                            color: apps.fontColor
                            focus: false
                            anchors.centerIn: parent
                            Keys.onReturnPressed: {
                                if(text==='')return
                                //panelLog.l(getNumNomText(text))
                                apps.uNom=text
                            }
                            onTextChanged: {
                                //panelLog.l(getNumNomText(text))
                                apps.uFirma=text
                            }
                            onFocusChanged: {
                                if(focus)selectAll()
                            }
                            Rectangle{
                                width: parent.width+app.fs
                                height: parent.height+app.fs
                                color: 'transparent'
                                //border.width: 2
                                //border.color: 'white'
                                z: parent.z-1
                                anchors.centerIn: parent
                            }
                        }
                    }
                }
            }
            Text{
                id: txtPersonalidad
                text: '<b>Personalidad:</b> '+r.currentNumPersonalidad+'<br /><b>N° de Nombre:</b> '+r.currentNumNombre+'<br /><b>Interior:</b> '+r.currentNumNombreInt+'<br /><b>Exterior:</b> '+r.currentNumNombreExt+'<br /><b>N° de Firma:</b> '+r.currentNumFirma+'<br /><b>Destino:</b> '+r.currentNumDestino
                color: apps.fontColor
                font.pixelSize: app.fs*0.5
                width: parent.width-app.fs
                textFormat: Text.RichText
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Rectangle{
                id: xAP
                width: r.width//-app.fs*0.5
                height: colAP.height+app.fs
                color: 'transparent'
                border.width: 2
                border.color: apps.fontColor
                radius: app.fs*0.2
                anchors.horizontalCenter: parent.horizontalCenter
                Column{
                    id: colAP
                    spacing: app.fs*0.5
                    anchors.centerIn: parent
                    Row{
                        spacing: app.fs*0.25
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{
                            id: labelAP
                            text: '<b>N° Año Personal</b>'
                            color: apps.fontColor
                            font.pixelSize: app.fs*0.5
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Rectangle{
                            id: xTiFechaAP
                            width: xForm.width-labelAP.contentWidth-rowAp.width-app.fs
                            height: app.fs*1.2
                            color: apps.backgroundColor
                            border.width: 2
                            border.color: apps.fontColor
                            anchors.verticalCenter: parent.verticalCenter
                            Text{
                                text: '<b>Año:</b>'
                                color: apps.fontColor
                                font.pixelSize: app.fs*0.25
                                anchors.bottom: parent.top
                                anchors.bottomMargin: app.fs*0.25
                            }
                            TextInput {
                                id: txtDataSearchFechaAP
                                text: ''
                                font.pixelSize: app.fs*0.5
                                width: parent.width-app.fs*0.2
                                wrapMode: Text.WordWrap
                                color: apps.fontColor
                                focus: true
                                //inputMask: '00.00.0000'
                                anchors.centerIn: parent
                                Keys.onReturnPressed: {
                                    if(text==='')return
                                    //panelLog.l(getNumNomText(text))
                                }
                                onTextChanged: {
                                    calcularAP()
                                }
                                onFocusChanged: {
                                    if(focus)selectAll()
                                }
                                Rectangle{
                                    width: parent.width+app.fs
                                    height: parent.height+app.fs
                                    color: 'transparent'
                                    //border.width: 2
                                    //border.color: 'white'
                                    z: parent.z-1
                                    anchors.centerIn: parent
                                }
                            }
                        }





                        Row{
                            id: rowAp
                            spacing: app.fs*0.5
                            anchors.verticalCenter: parent.verticalCenter
                            Text{
                                text: '<b>Año:</b> '
                                color: apps.fontColor
                                font.pixelSize: app.fs*0.5
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Rectangle{
                                id: xNumAP
                                width: app.fs*2
                                height: width
                                radius: width*0.5
                                border.width: app.fs*0.2
                                border.color: apps.fontColor
                                //rotation: 360-parent.rotation
                                color: apps.backgroundColor
                                anchors.verticalCenter: parent.verticalCenter
                                Text{
                                    text: '<b>'+r.currentNumAnioPersonal+'</b>'
                                    font.pixelSize: parent.width*0.8
                                    color: apps.fontColor
                                    anchors.centerIn: parent
                                }
                            }
                        }
                    }
                    Text{
                        id: f1
                        color: apps.fontColor
                        font.pixelSize: app.fs*0.8
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                }
            }
            Rectangle{
                id: xBtns
                width: parent.width//-app.fs*0.5
                height: colBtns.height+app.fs
                color: 'transparent'
                border.width: 2
                border.color: apps.fontColor
                radius: app.fs*0.2
                anchors.horizontalCenter: parent.horizontalCenter
                Text{
                    text: '<b>Calcular</b>'
                    color: apps.fontColor
                    font.pixelSize: app.fs*0.5
                    anchors.left: parent.left
                    anchors.leftMargin: app.fs*0.25
                    anchors.top: parent.top
                    anchors.topMargin: app.fs*0.25
                }
                Column{
                    id: colBtns
                    spacing: app.fs*0.25
                    anchors.centerIn: parent
                    Row{
                        spacing: app.fs*0.25
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{
                            text: '<b>Mostrar cálculo</b>'
                            color: apps.fontColor
                            font.pixelSize: app.fs*0.25
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        CheckBox{
                            id: checkBoxFormula
                            checked: apps.numShowFormula
                            anchors.verticalCenter: parent.verticalCenter
                            onCheckedChanged: apps.numShowFormula=checked
                        }
                    }
                    Row{
                        spacing: app.fs*0.25
                        anchors.horizontalCenter: parent.horizontalCenter
                        Button{
                            text:  'Natalicio'
                            anchors.verticalCenter: parent.verticalCenter
                            onClicked: {
                                if(txtDataSearchNom.text==='')return
                                panelLog.clear()
                                panelLog.l(getDataJsonNumDia())
                                panelLog.visible=true
                                panelLog.flk.contentY=0
                            }
                        }
                        Button{
                            text:  'Nombre'
                            anchors.verticalCenter: parent.verticalCenter
                            onClicked: {
                                if(txtDataSearchNom.text==='')return
                                panelLog.clear()
                                panelLog.l(getNumNomText(txtDataSearchNom.text))
                                panelLog.visible=true
                                panelLog.flk.contentY=0
                            }
                        }
                        Button{
                            text:  'Personalidad'
                            anchors.verticalCenter: parent.verticalCenter
                            onClicked: {
                                panelLog.clear()
                                if(checkBoxFormula.checked){
                                    panelLog.l('Personalidad '+r.currentNumPersonalidad+'\n')
                                    panelLog.l('Fórmula: '+f0.text+'\n')
                                    panelLog.l(getItemJson('per'+r.currentNumPersonalidad))
                                }else{
                                    panelLog.l('¿Cómo es su personalidad?\n')
                                    panelLog.l(getItemJson('per'+r.currentNumPersonalidad))
                                }
                                panelLog.visible=true
                                panelLog.flk.contentY=0
                            }
                        }
                        Button{
                            text:  'Nacimiento/Karma'
                            anchors.verticalCenter: parent.verticalCenter
                            onClicked: {
                                panelLog.clear()
                                if(checkBoxFormula.checked){
                                    panelLog.l('N° de Nacimiento/Karma '+r.currentNumNacimiento+'\n')
                                    panelLog.l('Fórmula: '+f0.text+'\n')
                                    panelLog.l(getItemJson('per'+r.currentNumNacimiento))
                                }else{
                                    panelLog.l('¿Cómo es su vibración de nacimiento o karma '+r.currentNumNacimiento+'?\n')
                                    panelLog.l(getItemJson('per'+r.currentNumNacimiento))
                                }
                                panelLog.visible=true
                                panelLog.flk.contentY=0
                            }
                        }
                    }
                    Row{
                        spacing: app.fs*0.25
                        anchors.horizontalCenter: parent.horizontalCenter
                        Button{
                            text:  'Años Personales'
                            anchors.verticalCenter: parent.verticalCenter
                            onClicked: {
                                panelLog.clear()
                                panelLog.l(mkDataList())
                                panelLog.visible=true
                                panelLog.flk.contentY=0
                            }
                        }
                        Button{
                            text:  'Calcular todo'
                            anchors.verticalCenter: parent.verticalCenter
                            onClicked: {
                                panelLog.clear()

                                //Personalidad
                                if(checkBoxFormula.checked){
                                    panelLog.l('Personalidad '+r.currentNumPersonalidad+'\n')
                                    panelLog.l('Fórmula: '+f0.text+'\n')
                                    panelLog.l(getItemJson('per'+r.currentNumPersonalidad))
                                }else{
                                    panelLog.l('¿Cómo es su personalidad?\n')
                                    panelLog.l(getItemJson('per'+r.currentNumPersonalidad))
                                }

                                //Número de nacimiento o karma
                                if(checkBoxFormula.checked){
                                    panelLog.l('N° de Nacimiento/Karma '+r.currentNumNacimiento+'\n')
                                    panelLog.l('Fórmula: '+f0.text+'\n')
                                    panelLog.l(getItemJson('per'+r.currentNumNacimiento))
                                }else{
                                    panelLog.l('¿Cómo es su vibración de nacimiento o karma '+r.currentNumNacimiento+'?\n')
                                    panelLog.l(getItemJson('per'+r.currentNumNacimiento))
                                }
                                panelLog.l('\n')

                                //Nombre
                                panelLog.l(getNumNomText(txtDataSearchNom.text))
                                panelLog.l('\n')

                                //Natalicio
                                panelLog.l(getDataJsonNumDia())
                                panelLog.l('\n')

                                //Firma
                                panelLog.l('¿Cómo es la energía de su firma?\n')
                                panelLog.l(getItemJson('firma'+r.currentNumFirma))
                                panelLog.l('\n')

                                //Destino
                                panelLog.l('¿Cómo podría ser su destino?\n')
                                panelLog.l(getItemJson('dest'+r.currentNumDestino))
                                panelLog.l('\n')


                                //Lista de 100 años personales
                                panelLog.l(mkDataList())
                                panelLog.l('\n')

                                panelLog.visible=true
                                panelLog.flk.contentY=0
                            }
                        }
                    }
                    Row{
                        spacing: app.fs*0.25
                        anchors.horizontalCenter: parent.horizontalCenter
                        Button{
                            text:  'Limpiar'
                            onClicked: panelLog.clear()
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Button{
                            text:  'Copiar'
                            onClicked: {
                                clipboard.setText(panelLog.text)
                            }
                            anchors.verticalCenter: parent.verticalCenter

                        }
                    }
                }
            }
        }
    }
    Timer{
        id: tCalc
        running: !panelLog.visible
        repeat: true
        interval: 1000
        onTriggered: {
            calc()
        }
    }
    Component.onCompleted: {
        let date = new Date(Date.now())
        txtDataSearchFechaAP.text=date.getFullYear()
        let a =[]
        let d = 'INICIOS, VIDA NUEVA, RENOVACIONES'
        a.push(d)
        d = 'TOMA DE DESICIONES, SALIR DE TUS FRONTERAS, LA REALIDAD SE TE PONE CARA A CARA, NO PODES ESQUIVARLA, MOMENTO DE HACERSE CARGO, ACEPTAR LA REALIDAD'
        a.push(d)
        d = 'NOTORIEDAD, BRILLO, OPCIONES, OPORTUNIDADES'
        a.push(d)
        d = 'CONSTRUCCIÓN, DISCIPLINA, TIEMPO DE PONER ORDEN EN TU VIDA'
        a.push(d)
        d = 'PROGRESO, MOVIMIENTO, SALIR DE LA ZONA DE CONFORT'
        a.push(d)
        d = 'TRABAJO EN RELACIONES, PRODUCTIVIDAD, GENERACIÓN'
        a.push(d)
        d = 'RESPONSABILIDAD Y ESTRUCTURA, ASUMIR LA PROPIA REALIDAD'
        a.push(d)
        d = 'COSECHA Y LOGROS, RETO Y CONQUISTA A SUPERAR'
        a.push(d)
        d = 'AUTOSUFICIENCIA, CONSOLIDACIÓN, CIERRE DE CICLO'
        a.push(d)
        r.aDes=a
    }
    function getNumNomText(text){
        let ret=''
        let t=text.toUpperCase().replace(/ /g, '')
        let av=[]
        let ac=[]
        let ml=t.split('')
        for(var i=0;i<ml.length;i++){
            let l=ml[i]
            if(l==='A'||l==='E'||l==='I'||l==='O'||l==='U'||l==='Á'||l==='É'||l==='Í'||l==='Ó'||l==='Ú'){
                av.push(l)
            }else{
                ac.push(l)
            }
        }
        let vtv=0
        let vtc=0
        let sfv=''
        let sfc=''
        let rc=0
        for(i=0;i<av.length;i++){
            rc=gvl(av[i])
            vtv+=rc
            if(i===0){
                sfv+=rc
            }else{
                sfv+='+'+rc
            }
        }
        sfv+='='+vtv
        for(i=0;i<ac.length;i++){
            rc=gvl(ac[i])
            vtc+=rc
            if(i===0){
                sfc+=rc
            }else{
                sfc+='+'+rc
            }
        }
        sfc+='='+vtc
        let m0

        let dataInt=''
        let dataExt=''
        let st='int'
        let st2='ext'
        let resM1=-1
        let resM2=-1
        if(vtv===11||vtv===33){
            dataInt='En su interior nació con el número Maestro '+vtv+'\n'
            dataInt+=getDataNum('intm', vtv)+'\n\n'
            //vtv=1
        }
        if(vtv===22||vtv===44){
            dataInt='En su interior nació con el número Maestro '+vtv+'\n'
            dataInt+=getDataNum('intm', vtv)+'\n\n'
            //vtv=2
        }
        if(vtc===11||vtc===33){
            dataExt='En su exterior nació con el número Maestro '+vtc+'\n'
            dataExt+=getDataNum('extm', vtc)+'\n\n'
            //vtc=1
        }
        if(vtc===22||vtc===44){
            dataExt='En su exterior nació con el número Maestro '+vtc+'\n'
            dataExt+=getDataNum('extm', vtc)+'\n\n'
            //vtc=2
        }
        if(vtv>9){
            m0=(''+vtv).split('')
            vtv=parseInt(m0[0])+parseInt(m0[1])
            sfv+='='+vtv
        }
        if(vtv>9){
            m0=(''+vtv).split('')
            vtv=parseInt(m0[0])+parseInt(m0[1])
            sfv+='='+vtv
        }
        if(vtc>9){
            m0=(''+vtc).split('')
            vtc=parseInt(m0[0])+parseInt(m0[1])
            sfc+='='+vtc
        }
        if(vtc>9){
            m0=(''+vtc).split('')
            vtc=parseInt(m0[0])+parseInt(m0[1])
            sfc+='='+vtc
        }
        //panelLog.l('st:'+st+' vtv:'+vtv)
        dataInt+=getDataNum(st, vtv)
        r.currentNumNombreInt=vtv
        //panelLog.l('st2:'+st2+' vtc: '+vtc)
        dataExt+=getDataNum(st2, vtc)
        r.currentNumNombreExt=vtc
        let nunNombre=r.currentNumNombreInt+r.currentNumNombreExt
        if(nunNombre>9){
            m0=(''+nunNombre).split('')
            nunNombre=parseInt(m0[0])+parseInt(m0[1])
        }
        if(nunNombre>9){
            m0=(''+nunNombre).split('')
            nunNombre=parseInt(m0[0])+parseInt(m0[1])
        }
        r.currentNumNombre=nunNombre
        let numDestino=nunNombre + r.currentNumFirma
        r.currentNumDestino=numDestino

        if(checkBoxFormula.checked){
            ret+='Vocales: '+av.toString()+'\n'
            ret+='Fórmula de Vocales: '+sfv+'\n'
            ret+='Vibración '+dataInt+'\n'
            ret+='\n'
            ret+='Consonantes: '+ac.toString()+'\n'
            ret+='Fórmula de Consonantes: '+sfc+'\n'
            ret+='Vibración '+dataExt+'\n'
        }else{
            ret+='¿Cómo es la forma de ser de '+txtDataSearchNom.text+' por dentro?\n\n'+dataInt+'\n\n'
            ret+='¿Cómo es la forma de ser de '+txtDataSearchNom.text+' hacia afuera?\n\n'+dataExt+'\n\n'
        }
        return ret
    }
    function setNumFirma(){
        let t=txtDataSearchFirma.text.toUpperCase().replace(/ /g, '')//.replace(/./g, '')
        let av=[]
        let ml=t.split('')
        //console.log('vtv firma:'+ml)
        for(var i=0;i<ml.length;i++){
            let l=ml[i]
            av.push(l)
        }
        let rc=0
        let vtv=0
        for(i=0;i<av.length;i++){
            rc=gvl(av[i])
            vtv+=rc
            console.log('vtv firma:'+vtv)
        }

        let m0
        if(vtv===11||vtv===33){
            dataInt='En su interior nació con el número Maestro '+vtv+'\n'
            dataInt+=getDataNum('intm', vtv)+'\n\n'
            //vtv=1
        }
        if(vtv===22||vtv===44){
            return vtv
        }
        if(vtv>9){
            m0=(''+vtv).split('')
            vtv=parseInt(m0[0])+parseInt(m0[1])

        }
        if(vtv>9){
            m0=(''+vtv).split('')
            vtv=parseInt(m0[0])+parseInt(m0[1])
        }
        return vtv
    }
    function getDataJsonNumDia(){
        let ret=''
        let mfecha=txtDataSearchFecha.text.split('.')
        if(!mfecha[0]||!mfecha[1]||!mfecha[2]||mfecha[2].length<4){
            return ret
        }
        let stringDia=''
        let dia=parseInt(mfecha[0])
        if(dia>0&&dia<=31){
            stringDia=getDataNumDia(dia)
            ret+='Natalicio en día '+dia+': '+stringDia
        }
        return ret
    }
    function getDataNum(t, v){
        //panelLog.l('t:'+t)
        //panelLog.l('v:'+v)
        let ret='?'
        let jsonString
        if(r.jsonNum===''){
            r.jsonNum=unik.getFile('num.json')
        }
        jsonString=r.jsonNum.replace(/\n/g, ' ')
        let json=JSON.parse(jsonString)

        ret=json[''+t+''+v]
        return ret
    }
    function getDataNumDia(dia){
        let ret='?'
        let jsonString
        if(r.jsonNum===''){
            r.jsonNum=unik.getFile('num.json')
        }
        jsonString=r.jsonNum.replace(/\n/g, ' ')
        let json=JSON.parse(jsonString)

        ret=json['d'+dia]
        return ret
    }
    function getItemJson(i){
        let ret='?'
        let jsonString
        if(r.jsonNum===''){
            r.jsonNum=unik.getFile('num.json')
        }
        jsonString=r.jsonNum.replace(/\n/g, ' ')
        let json=JSON.parse(jsonString)

        ret=json[i]
        return ret
    }
    function gvl(l){
        let r=0
        let col1=['A', 'J', 'R']
        let col2=['B', 'K', 'S']
        let col3=['C', 'L', 'T']
        let col4=['D', 'M', 'U']
        let col5=['E', 'N', 'V']
        let col6=['F', 'Ñ', 'W']
        let col7=['G', 'O', 'X']
        let col8=['H', 'P', 'Y']
        let col9=['I', 'Q', 'Z']
        if(col1.indexOf(l)>=0){
            r=1
        }else if(col2.indexOf(l)>=0){
            r=2
        }else if(col3.indexOf(l)>=0){
            r=3
        }else if(col4.indexOf(l)>=0){
            r=4
        }else if(col5.indexOf(l)>=0){
            r=5
        }else if(col6.indexOf(l)>=0){
            r=6
        }else if(col7.indexOf(l)>=0){
            r=7
        }else if(col8.indexOf(l)>=0){
            r=8
        }else if(col9.indexOf(l)>=0){
            r=9
        }else{
            r=9
        }
        return r
    }
    function mkDataList(){
        let ret=''
        let mfecha=txtDataSearchFecha.text.split('.')
        if(!mfecha[0]||!mfecha[1]||!mfecha[2]||mfecha[2].length<4){
            return ret
        }
        var ai=parseInt(mfecha[2])
        var d =parseInt(mfecha[0])
        var m =parseInt(mfecha[1])
        var sformTodo='Ciclo de Vida Numerológico\n\n'
        //return
        for(var i=ai;i<ai+101;i++){
            var currentNumAP=-1
            var sform=''
            let a = i
            let sf=''+d+'/'+m+'/'+a
            //let aGetNums=JS.getNums(sf)
            //currentNumAnioPersonal=aGetNums[0]
            let msfd=(''+d).split('')
            let sfd=''+msfd[0]
            if(msfd.length>1){
                sfd +='+'+msfd[1]
            }
            let msfm=(''+m).split('')
            let sfm=''+msfm[0]
            if(msfm.length>1){
                sfm +='+'+msfm[1]
            }
            //let msform=(''+a).split('')
            let msfa=(''+a).split('')
            let sfa=''+msfa[0]
            if(msfa.length>1){
                sfa +='+'+msfa[1]
            }
            if(msfa.length>2){
                sfa +='+'+msfa[2]
            }
            if(msfa.length>3){
                sfa +='+'+msfa[3]
            }
            let sform= sfd + '+' + sfm + '+' + sfa//msform[0] + '+' + msform[1] + '+'  + msform[2]+ '+'  + msform[3]
            let sum=0
            let mSum=sform.split('+')
            for(var i2=0;i2<mSum.length;i2++){
                sum+=parseInt(mSum[i2])
            }
            let mCheckSum=(''+sum).split('')
            if(mCheckSum.length>1){
                let dobleDigSum=parseInt(mCheckSum[0])+parseInt(mCheckSum[1])
                sform+='='+sum+'='+dobleDigSum
                let mCheckSum2=(''+dobleDigSum).split('')
                if(mCheckSum2.length>1){
                    let dobleDigSum2=parseInt(mCheckSum2[0])+parseInt(mCheckSum2[1])
                    sform+='='+dobleDigSum2
                    currentNumAP=dobleDigSum2
                }else{
                    currentNumAP=dobleDigSum
                }
            }else{
                currentNumAP=sum
            }
            let edad=a - ai
            var sp
            if(edad===0){
                sp='Período: Desde el nacimiento '+d+'/'+m+'/'+a+' hasta el día '+d+'/'+m+'/'+parseInt(a + 1)
            }else{
                sp='Período: Desde el cumpleaños del día '+d+'/'+m+'/'+a+' hasta el día '+d+'/'+m+'/'+parseInt(a + 1)
            }
            //sformTodo+='Año: '+i+' - Edad: '+edad+' - Ciclo: '+parseInt(currentNumAP)+'\n'+sp+'\nCálculo: '+sform+'\n'+aDes[currentNumAP - 1]+'\n\n'
            sformTodo+='Año: '+i+' - Edad: '+edad+'\nAño personal de ciclo: '+parseInt(currentNumAP)+'\n'+sp+'\nCálculo: '+sform+'\n'+aDes[currentNumAP - 1]+'\n\n'
        }
        return sformTodo
    }
    function printData(nom, date){
        txtDataSearchNom.text=nom
        let d = date.getDate()
        let m = date.getMonth() + 1
        let a = date.getFullYear()
        let f = d + '/' + m + '/' + a
        let aGetNums=JS.getNums(f)
        let vcurrentNumNacimiento=aGetNums[0]
        panelLog.l('Número de Karma '+vcurrentNumNacimiento+'\n')
        panelLog.l(getNumNomText(nom))
        panelLog.l('¿Cómo es su personalidad?\n')
        panelLog.l(getItemJson('per'+vcurrentNumNacimiento))
    }
    function calcularAP(){
        r.esMaestro=false
        let mfecha=txtDataSearchFecha.text.split('.')
        if(!mfecha[0]||!mfecha[1]||!mfecha[2]||mfecha[2].length<4){
            f1.text=''
            currentNumAnioPersonal=-1
            return
        }
        let d=mfecha[0]
        let m=mfecha[1]
        let a = txtDataSearchFechaAP.text
        let sf=''+d+'/'+m+'/'+a
        let msfd=(''+d).split('')
        let sfd=''+msfd[0]
        if(msfd.length>1){
            sfd +='+'+msfd[1]
        }
        let msfm=(''+m).split('')
        let sfm=''+msfm[0]
        if(msfm.length>1){
            sfm +='+'+msfm[1]
        }
        //let msform=(''+a).split('')
        let msfa=(''+a).split('')
        let sfa=''+msfa[0]
        if(msfa.length>1){
            sfa +='+'+msfa[1]
        }
        if(msfa.length>2){
            sfa +='+'+msfa[2]
        }
        if(msfa.length>3){
            sfa +='+'+msfa[3]
        }
        let sform= sfd + '+' + sfm + '+' + sfa//msform[0] + '+' + msform[1] + '+'  + msform[2]+ '+'  + msform[3]
        let sum=0
        let mSum=sform.split('+')
        for(var i=0;i<mSum.length;i++){
            sum+=parseInt(mSum[i])
        }
        let mCheckSum=(''+sum).split('')
        if(mCheckSum.length>1){
            if(sum===11||sum===22||sum===33){
                r.esMaestro=true
            }
            let dobleDigSum=parseInt(mCheckSum[0])+parseInt(mCheckSum[1])
            sform+='='+sum+'='+dobleDigSum
            let mCheckSum2=(''+dobleDigSum).split('')
            if(mCheckSum2.length>1){
                let dobleDigSum2=parseInt(mCheckSum2[0])+parseInt(mCheckSum2[1])
                sform+='='+dobleDigSum2
                currentNumAnioPersonal=dobleDigSum2
            }else{
                currentNumAnioPersonal=dobleDigSum
            }

        }else{
            currentNumAnioPersonal=sum
        }
        f1.text=sform
        let edad=a - parseInt(txtDataSearchFechaAP.text)

        let sp='Período: Desde el cumpleaños del día '+d+'/'+m+'/'+a+' hasta el día '+d+'/'+m+'/'+parseInt(a + 1)
        panelLog.l('Año: '+a+' - Edad: '+edad+' - Ciclo: '+parseInt(r.currentNum +1)+'\n'+sp+'\nCálculo: '+f1.text+'\n'+aDes[r.currentNum]+'\n')

    }
    function calcularPersonalidad(){
        let ret=r.currentNumNacimiento + r.currentNumNombre
        if(ret>9){
            let m0=(''+ret).split('')
            ret=parseInt(m0[0]+m0[1])
        }
        r.currentNumPersonalidad=ret
    }
    function setNumNac(){
        let mfecha=txtDataSearchFecha.text.split('.')
        if(!mfecha[0]||!mfecha[1]||!mfecha[2]||mfecha[2].length<4){
            f0.text=''
            currentNumNacimiento=-1
            return
        }
        let d=mfecha[0]
        let m=mfecha[1]
        let a = mfecha[2]
        let sf=''+d+'/'+m+'/'+a
        let aGetNums=JS.getNums(sf)
        currentNumNacimiento=aGetNums[0]
        let dateP = new Date(parseInt(txtDataSearchFechaAP.text), m - 1, d, 0, 1)
        //controlTimeYear.currentDate=dateP
        r.currentDate = dateP
        let msfd=(''+d).split('')
        let sfd=''+msfd[0]
        if(msfd.length>1){
            sfd +='+'+msfd[1]
        }
        let msfm=(''+m).split('')
        let sfm=''+msfm[0]
        if(msfm.length>1){
            sfm +='+'+msfm[1]
        }
        //let msform=(''+a).split('')
        let msfa=(''+a).split('')
        let sfa=''+msfa[0]
        if(msfa.length>1){
            sfa +='+'+msfa[1]
        }
        if(msfa.length>2){
            sfa +='+'+msfa[2]
        }
        if(msfa.length>3){
            sfa +='+'+msfa[3]
        }
        let sform= sfd + '+' + sfm + '+' + sfa//msform[0] + '+' + msform[1] + '+'  + msform[2]+ '+'  + msform[3]
        let sum=0
        let mSum=sform.split('+')
        for(var i=0;i<mSum.length;i++){
            sum+=parseInt(mSum[i])
        }
        let mCheckSum=(''+sum).split('')
        if(mCheckSum.length>1){
            if(sum===11||sum===22||sum===33){
                //r.esMaestro=true
            }
            let dobleDigSum=parseInt(mCheckSum[0])+parseInt(mCheckSum[1])
            sform+='='+sum+'='+dobleDigSum
            let mCheckSum2=(''+dobleDigSum).split('')
            if(mCheckSum2.length>1){
                let dobleDigSum2=parseInt(mCheckSum2[0])+parseInt(mCheckSum2[1])
                sform+='='+dobleDigSum2
                currentNumNacimiento=dobleDigSum2
            }else{
                currentNumNacimiento=dobleDigSum
            }

        }else{
            currentNumNacimiento=sum
        }
        f0.text=sform
        apps.uFecha=txtDataSearchFecha.text
        calcularAP()
    }
    function calc(){
        r.currentNumFirma=setNumFirma()
        setNumNac()
        let dataNombre=getNumNomText(txtDataSearchNom.text)


    }
}
