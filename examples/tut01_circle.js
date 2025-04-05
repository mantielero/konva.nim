/* Generated by the Nim Compiler v2.0.14 */
var framePtr = null;
var excHandler = 0;
var lastJSError = null;
var NTI33555173 = {size: 0, kind: 17, base: null, node: null, finalizer: null};
var NTI33555183 = {size: 0, kind: 17, base: null, node: null, finalizer: null};
var NTI704643152 = {size: 0, kind: 17, base: null, node: null, finalizer: null};
var NTI184549387 = {size: 0,kind: 34,base: null,node: null,finalizer: null};
var NTI33554450 = {size: 0,kind: 29,base: null,node: null,finalizer: null};
var NTI184549391 = {size: 0,kind: 36,base: null,node: null,finalizer: null};
var NTI1073741830 = {size: 0, kind: 17, base: null, node: null, finalizer: null};
var NNI1073741830 = {kind: 2, len: 6, offset: 0, typ: null, name: null, sons: [{kind: 1, offset: "x", len: 0, typ: NTI184549391, name: "x", sons: null}, 
{kind: 1, offset: "y", len: 0, typ: NTI184549391, name: "y", sons: null}, 
{kind: 1, offset: "radius", len: 0, typ: NTI184549391, name: "radius", sons: null}, 
{kind: 1, offset: "fill", len: 0, typ: NTI33554450, name: "fill", sons: null}, 
{kind: 1, offset: "stroke", len: 0, typ: NTI33554450, name: "stroke", sons: null}, 
{kind: 1, offset: "strokeWidth", len: 0, typ: NTI184549387, name: "strokeWidth", sons: null}]};
NTI1073741830.node = NNI1073741830;
var NNI704643152 = {kind: 2, len: 0, offset: 0, typ: null, name: null, sons: []};
NTI704643152.node = NNI704643152;
var NNI33555183 = {kind: 2, len: 0, offset: 0, typ: null, name: null, sons: []};
NTI33555183.node = NNI33555183;
var NNI33555173 = {kind: 2, len: 0, offset: 0, typ: null, name: null, sons: []};
NTI33555173.node = NNI33555173;
NTI33555183.base = NTI33555173;
NTI704643152.base = NTI33555183;
NTI1073741830.base = NTI704643152;

function toJSStr(s_33556901) {
  var result_33556902 = null;

    var res_33556943 = newSeq_33556919((s_33556901).length);
    var i_33556944 = 0;
    var j_33556945 = 0;
    Label1: {
        Label2: while (true) {
        if (!(i_33556944 < (s_33556901).length)) break Label2;
          var c_33556946 = s_33556901[i_33556944];
          if ((c_33556946 < 128)) {
          res_33556943[j_33556945] = String.fromCharCode(c_33556946);
          i_33556944 += 1;
          }
          else {
            var helper_33556959 = newSeq_33556919(0);
            Label3: {
                Label4: while (true) {
                if (!true) break Label4;
                  var code_33556960 = c_33556946.toString(16);
                  if ((((code_33556960) == null ? 0 : (code_33556960).length) == 1)) {
                  helper_33556959.push("%0");;
                  }
                  else {
                  helper_33556959.push("%");;
                  }
                  
                  helper_33556959.push(code_33556960);;
                  i_33556944 += 1;
                  if ((((s_33556901).length <= i_33556944) || (s_33556901[i_33556944] < 128))) {
                  break Label3;
                  }
                  
                  c_33556946 = s_33556901[i_33556944];
                }
            };
++excHandler;
            try {
            res_33556943[j_33556945] = decodeURIComponent(helper_33556959.join(""));
--excHandler;
} catch (EXCEPTION) {
 var prevJSError = lastJSError;
 lastJSError = EXCEPTION;
 --excHandler;
            res_33556943[j_33556945] = helper_33556959.join("");
            lastJSError = prevJSError;
            } finally {
            }
          }
          
          j_33556945 += 1;
        }
    };
    if (res_33556943.length < j_33556945) { for (var i = res_33556943.length ; i < j_33556945 ; ++i) res_33556943.push(null); }
               else { res_33556943.length = j_33556945; };
    result_33556902 = res_33556943.join("");

  return result_33556902;

}
var objectID_771752113 = [0];

function newSeq_33556919(len_33556921) {
  var result_33556922 = [];

    result_33556922 = new Array(len_33556921); for (var i = 0 ; i < len_33556921 ; ++i) { result_33556922[i] = null; }
  return result_33556922;

}

function newStage_1258291214(container_1258291215, width_1258291216, height_1258291217, x_1258291218, y_1258291219, scale_1258291220, scaleX_1258291221, scaleY_1258291222) {
  var result_1258291223 = null;

  BeforeRet: {
    var config_1258291224 = {};
    config_1258291224["container"] = toJSStr(container_1258291215);
    config_1258291224["width"] = ((width_1258291216) | 0);
    config_1258291224["height"] = ((height_1258291217) | 0);
    if ((0 <= x_1258291218)) {
    config_1258291224["x"] = ((x_1258291218) | 0);
    }
    
    if ((0 <= y_1258291219)) {
    config_1258291224["y"] = ((y_1258291219) | 0);
    }
    
    if (!((scale_1258291220 == 1))) {
    config_1258291224["scale"] = ((scale_1258291220) | 0);
    }
    
    if (!((scaleX_1258291221 == 1))) {
    config_1258291224["scaleX"] = ((scaleX_1258291221) | 0);
    }
    
    if (!((scaleY_1258291222 == 1))) {
    config_1258291224["scaleY"] = ((scaleY_1258291222) | 0);
    }
    
    result_1258291223 = new Konva.Stage(config_1258291224);
    break BeforeRet;
  };

  return result_1258291223;

}

function toFloat_33556008(i_33556009) {
  var result_33556010 = 0.0;

    result_33556010 = i_33556009;

  return result_33556010;

}

function HEX2F_33556020(x_33556021, y_33556022) {
  var result_33556023 = 0.0;

    result_33556023 = (toFloat_33556008(x_33556021) / toFloat_33556008(y_33556022));

  return result_33556023;

}

function main_553648132() {
    var stage_553648133 = newStage_1258291214([99,111,110,116,97,105,110,101,114], 500, 500, 0, 0, 1, 1, 1);
    var layer_553648134 = new Konva.Layer();
    var circle_553648135 = new Konva.Circle({x: HEX2F_33556020(((stage_553648133.width()) | 0), 2), y: HEX2F_33556020(((stage_553648133.height()) | 0), 2), radius: 70.0, fill: "red", stroke: "black", strokeWidth: 4, m_type: NTI1073741830});
    layer_553648134.add(circle_553648135);
    stage_553648133.add(layer_553648134);

  
}
main_553648132();
