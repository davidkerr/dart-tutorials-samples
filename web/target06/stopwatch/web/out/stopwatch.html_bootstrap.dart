import "dart:async" as hB;import "dart:collection" as TC;import "dart:html" as u;import "dart:isolate" as fC;class UC{static const  VC="Chrome";static const  WC="Safari";final  OC;final  minimumVersion;const UC(this.OC,[this.minimumVersion]);}class XC{final  name;const XC(this.name);}final OB=new l();var PB='00:00'; get YB{if(tB){uB(OB,o.RB,'counter');}return PB;}set YB( g){if(sB(OB)){vB(OB,o.RB,'counter',PB,g);}PB=g;}var IB=new Stopwatch();var JB;var QB;var DB; iB(){QB=u.query("#startbutton");JB=u.query("#stopbutton");JB.disabled=true;DB=u.query("#resetbutton");DB.disabled=true;} jB(){IB.start();var g=new Duration(seconds:1);new hB.Timer.periodic(g,mB);QB.disabled=true;JB.disabled=false;DB.disabled=true;} kB(){IB.stop();QB.disabled=false;DB.disabled=false;JB.disabled=true;} lB(){IB.reset();YB='00:00';DB.disabled=true;} mB( iC){var g=IB.elapsedMilliseconds~/1000;var h=0;if(g>=60){h=g~/60;g=g%60;}var i=(h<=9)?'0${h}':'${h}';var j=(g<=9)?'0${g}':'${g}';YB='${i}:${j}';} nB(){var jC=u.document.body;var kC,lC,mC,nC;var oC=new bC(jC);kC=jC.nodes[3].nodes[1];var pC=oC.QC(()=>YB,false);kC.nodes.addAll([new u.Text('\n      '),pC,new u.Text('\n      ')]);lC=jC.nodes[3].nodes[3].nodes[1];oC.listen(lC.onClick,(g){jB();});mC=jC.nodes[3].nodes[3].nodes[3];oC.listen(mC.onClick,(g){kB();});nC=jC.nodes[3].nodes[3].nodes[5];oC.listen(nC.onClick,(g){lB();});oC.VB();oC.insert();}main(){cB=true;iB();nB();}typedef  v( e);typedef  oB( changes);typedef  w();typedef  pB();class KB{final oldValue;final newValue;final  changes;KB(this.oldValue,this.newValue,[this.changes]); operator==(g){return g is KB&&oldValue==g.oldValue&&newValue==g.newValue&&changes==g.changes;} get hashCode=>FC(oldValue,newValue,changes); toString(){if(changes!=null)return '#<ChangeNotification to ${newValue}: ${changes}>';return '#<ChangeNotification from ${oldValue} to ${newValue}>';}}class o{static const RB=1;static const SB=2;static const ZB=SB|4;static const aB=SB|8;final  type;final key;final oldValue;final newValue;o(this.type,this.key,this.oldValue,this.newValue); operator==(g){return g is o&&type==g.type&&key==g.key&&oldValue==g.oldValue&&newValue==g.newValue;} get hashCode=>GC(type,key,oldValue,newValue); toString(){var g;switch (type){case RB:g='field';break;case SB:g='index';break;case ZB:g='insert';break;case aB:g='remove';break;}return '#<ChangeRecord ${g} ${key} from ${oldValue} to ${newValue}>';}} qB(g, i,[ debugName]){if(g is l){var h=g;return TB(h,(k){i(new KB(h,h,k));});}var j=new LB(g,i,debugName);if(!j.qC()){return wB;}return j.rC;} TB( g, i){if(g.CB==null)g.CB=new UB();var h=g.CB.add(i);return h.remove;}class l{var CB;var BB;final  hashCode= ++l.rB;static var rB=0;} sB( g)=>g.CB!=null&&g.CB.head!=null; get tB=>AB!=null; uB( g, h,i)=>AB.sC(g,h,i); vB( g, j,k, h, i){if((j&(o.ZB|o.aB))==0){if(h==i)return;}if(q==null){q=[] ;HC(xB);}if(g.BB==null){g.BB=[] ;q.add(g);}g.BB.add(new o(j,k,h,i));} wB(){}var AB;var bB=100;var q;var s; xB(){var p=0;while (q!=null||s!=null){var j=q;q=null;var i=s;s=null;if(p++ ==bB){yB(j,i);return;}if(j!=null){for(var h in j){var HB=h.BB;h.BB=null;for(var g=h.CB.head;g!=null;g=g.next){var k=g.value;try {k(HB);}catch (XB,t){EB(XB,t,k,'from ${h}');}}}}if(i!=null){i.forEach((eC,SC){SC.tC();});}}} yB( k, j){var g=[] ;if(k!=null){for(var i in k){var HB=i.BB;g.add('${i} ${HB}');}}if(j!=null){for(var p in j.values){var h=p.tC();if(h!=null)g.add('${p} ${h}');}}q=null;s=null;var t='exceeded notifiction limit of ${bB}, possible ' 'circular reference in observer callbacks: ${g.take(10).join(", ")}';BC(t);}class LB{static var zB=0;final  uC= ++LB.zB;final  vC;final  wC;final  xC;final  yC=new Map();final  zC=[] ;var AD=false;var BD;LB(this.vC,this.wC,this.xC); toString()=>xC!=null?'<observer ${uC}: ${xC}>':'<observer ${uC}>'; qC(){var h=AB;AB=this;try {BD=vC();if(BD is Iterable&&BD is !List&&BD is !l){BD=(BD as Iterable).toList();}}catch (g,i){EB(g,i,vC,'from ${this}');BD=null;}yC.forEach(CD);yC.clear();assert(AB==this);AB=h;DD();return zC.length>0;} ED( i){try {wC(i);}catch (g,h){EB(g,h,wC,'from ${this}');}} DD(){var g=BD;if(g is !l)return;zC.add(TB(g,(h){ED(new KB(g,g,h));}));} sC( p, t,g){var i=yC.putIfAbsent(p,()=>new Map());try {var h=i[g];if(h==null)h=0;i[g]=h|t;}catch (j,k){EB(j,k,g,'hashCode or operator == from ${this}');}} CD( i, j){zC.add(TB(i,(k){if(AD)return;for(var g in k){var h=j[g.key];if(h!=null&&(h&g.type)!=0){AD=true;if(s==null){s=new TC.SplayTreeMap();}s[uC]=this;return;}}}));} rC(){for(var g in zC){g();}AD=false;} tC(){if(!AD)return null;var g=BD;rC();qC();try {if(g==BD)return null;}catch (i,j){EB(i,j,g,'operator == from ${this}');return null;}var h=new KB(g,BD);ED(h);return h;}}typedef  AC( message);var BC=(g)=>print(g);typedef  CC(error,stackTrace,obj, message);var EB=DC; DC(i,g,h, j){print('web_ui.observe: unhandled error calling ${h} ${j}.\n' 'error:\n${i}\n\nstack trace:\n${g}');}class EC{EC();}class m<n>{var FD;var GD;var HD;var ID;m.gC( g,this.HD):ID=g{if(HD!=null)HD.JD++ ;} get next=>GD; get value=>ID;set value( g)=>ID=g; KD( g, h){GD=h;FD=g;if(g!=null)g.GD=this;if(h!=null)h.FD=this;return this;} append( g)=>new m<n>.gC(g,HD).KD(this,GD); remove(){if(HD==null)return;HD.JD-- ;if(FD!=null){FD.GD=GD;}else{HD.LD=GD;}if(GD!=null){GD.FD=FD;}else{HD.MD=FD;}GD=null;FD=null;HD=null;}}class UB<n> extends TC.IterableBase<n>{var LD;var MD; get length=>JD;var JD=0;UB(){} get head=>LD; add( h){var g=new m<n>.gC(h,this);if(MD==null)return LD=MD=g;return MD=g.KD(MD,null);} addLast( g)=>add(g); addAll( g)=>g.forEach(add); get iterator=>new YC<n>(this);}class YC<n> implements Iterator<n>{var ND;var HD;var OD;var PD=-1;YC(this.HD){ND=new List<m>(HD.length);var h=0;var g=HD.head;while (g!=null){ND[h++ ]=g;g=g.next;}} get current=>OD; moveNext(){do{PD++ ;}while(PD<ND.length&&ND[PD].HD!=HD);if(PD<ND.length){OD=ND[PD].value;return true;}else{OD=null;return false;}}}FB(h,g)=>h.hashCode*31+g.hashCode;FC(h,g,i)=>FB(FB(h,g),i);GC(g,i,h,j)=>FB(FB(g,i),FB(h,j)); HC( h()){var g=new fC.ReceivePort();g.receive((i,j){g.close();h();});g.toSendPort().send(null);} IC(h, g,[ stringValue]){var i=h is EC;if(stringValue==null){stringValue=h.toString();}if(!i&&g is u.Text){g.text=stringValue;}else{var j=g;g=i?new u.Element.html(stringValue):new u.Text(stringValue);j.replaceWith(g);}return g;}abstract class MB{ VB(){} insert(); remove();}class ZC extends MB{final  gB;var QD;final  listener;ZC(this.gB,this.listener); insert(){QD=gB.listen(listener);} remove(){QD.cancel();QD=null;}}class aC extends MB{final exp;final  action;final  isFinal;var NB;aC(this.exp,this.action,this.isFinal); insert(){if(isFinal){action(new KB(null,exp()));}else if(NB!=null){throw new StateError('binding already attached');}else{NB=KC(exp,action,'generic-binding');}} remove(){if(!isFinal){NB();NB=null;}}}class bC extends MB{final  RC;final  children=[] ;final  nodes=[] ;bC(this.RC); listen( i, h){children.add(new ZC(i,(g){h(g);LC();}));} QC( h,i){var g=new u.Text('');children.add(new aC(()=>'${h()}',(j){g=IC(h(),g,j.newValue);},i));return g;} add( g)=>nodes.add(g); addAll( g)=>nodes.addAll(g); VB(){for(var g=0,h=children.length;g<h;g++ ){children[g].VB();}} insert(){for(var g=0,h=children.length;g<h;g++ ){children[g].insert();}} remove(){for(var g=children.length-1;g>=0;g-- ){children[g].remove();}children.clear();}}var cB=false; JC(g, j,[ debugName]){if(cB)return qB(g,j);if(j==null)return (){};if(GB==null)GB=new UB<dB>();var h;var i=false;if(g is fB){h=(g as fB).RD;}else if(g is Function){h=g;try {var k=g();if(k is List){i=true;}else if(k is Iterable){i=true;h=()=>g().toList();}}catch (p,XB){print('error: evaluating ${debugName!=null?debugName:"<unnamed>"} ' 'watcher threw error (${p}, ${XB})');}}else if(g is List){h=()=>g;i=true;}else if(g is Iterable){h=()=>g.toList();i=true;}var t=i?new cC(h,j,debugName):new dB(h,j,debugName);var HB=GB.add(t);return HB.remove;} KC(h,i,[debugName]){var j=JC(h,i,debugName);var g=h;if(g is Function){g=g();}if(g is Iterable&&g is !List){g=g.toList();}i(new KB(null,g));return j;}var GB;class dB{final  WB;final  RD;final  SD;var TD;dB(this.RD,this.SD,this.WB){TD=RD();} toString()=>WB==null?'<unnamed>':WB; PC(){var g=UD();if(VD(g)){var h=TD;WD(g);SD(new KB(h,g));return true;}return false;} VD(g)=>TD!=g; WD(g){TD=g;}UD(){try {return RD();}catch (g,h){print('error: evaluating ${this} watcher threw an exception (${g}, ${h})');}return TD;}}final  eB=10; LC(){if(GB==null)return;var g;var h=0;do{g=false;for(var i in GB){if(i.PC()){g=true;}}}while(g&& ++h<eB);if(h==eB){print('Possible loop in watchers propagation, stopped dispatch.');}}typedef  MC<NC>();class fB<NC>{fB();}class cC<NC> extends dB{cC(g, i, h):super(g,i,h){WD(UD());} VD( h){if(TD.length!=h.length)return true;for(int g=0;g<TD.length;g++ ){if(TD[g]!=h[g])return true;}return false;} WD(g){TD=new List<NC>.from(g);}}//@ sourceMappingURL=stopwatch.html_bootstrap.dart.map
