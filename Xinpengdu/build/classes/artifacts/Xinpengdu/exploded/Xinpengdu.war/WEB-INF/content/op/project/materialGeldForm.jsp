<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" id="materialGeldId_materialGeld" />
<!-- Add MaterialGeld modal dialog -->
<div id="addMaterialGeldModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">材料支付款</h4>
            </div>
            <div class="modal-body form-horizontal materialGeldAddModal">

                <div class="form-group has-feedback">
                    <label for="summaryAddModal_materialGeld" class="col-sm-2 control-label">摘要:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="summaryAddModal_materialGeld" name="summary" maxLength="30" autocomplete="off" placeholder="" title="摘要">
                    </div>
                    <label for="payDateAddModal_materialGeld" class="col-sm-2 control-label">支付日期:</label>
                    <div class="input-daterange col-md-4" id="payDateDate_AddModal_materialGeld">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="payDateAddModal_materialGeld" name="payDate" style="border-radius: 4px;" readonly="readonly" title="支付日期"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="payAmountAddModal_materialGeld" class="col-sm-2 control-label">支付金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control again_input required" id="payAmountAddModal_materialGeld" name="payAmount" maxLength="30" autocomplete="off" placeholder="" title="支付金额">
                    </div>
                    <label for="cumulativePayAmountAddModal_materialGeld" class="col-sm-2 control-label">累计支付金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="cumulativePayAmountAddModal_materialGeld" name="cumulativePayAmount" readonly="true" maxLength="30" autocomplete="off" placeholder="" title="累计支付金额">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="noPayAmountAddModal_materialGeld" class="col-sm-2 control-label">未付款金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="noPayAmountAddModal_materialGeld" name="noPayAmount" readonly="true" maxLength="30" autocomplete="off" placeholder="" title="未付款金额">
                    </div>
                    <label for="isAutoTransferAddModal_materialGeld" class="col-sm-2 control-label">是否自动转入:</label>
                    <div class="col-sm-4">
                        <select id="isAutoTransferAddModal_materialGeld" class="input-sm col-md-12" title="是否自动转入" >
                            <option value="1">是</option>
                            <option value="2">否</option>
                        </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkAddModal_materialGeld" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control ipt_content_left" id="remarkAddModal_materialGeld" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="addMaterialGeldModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit MaterialGeld modal dialog -->
<div id="editMaterialGeldModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">材料支付款信息</h4>
            </div>
            <div class="modal-body form-horizontal materialGeldEditModal">

                <div class="form-group has-feedback">
                    <label for="summaryEditModal_materialGeld" class="col-sm-2 control-label">摘要:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control ipt_content_left" id="summaryEditModal_materialGeld" name="summary" maxLength="30" autocomplete="off" placeholder="" title="摘要">
                    </div>
                    <label for="payDateEditModal_materialGeld" class="col-sm-2 control-label">支付日期:</label>
                    <div class="input-daterange col-md-4" id="payDateDate_EditModal_materialGeld">
                        <input type="text" class="form-control col-md-12 dateSelect required" id="payDateEditModal_materialGeld" name="payDate" style="border-radius: 4px;" readonly="readonly" title="支付日期"/>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="payAmountEditModal_materialGeld" class="col-sm-2 control-label">支付金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control again_input required" id="payAmountEditModal_materialGeld" name="payAmount" maxLength="30" autocomplete="off" placeholder="" title="支付金额">
                    </div>
                    <label for="cumulativePayAmountEditModal_materialGeld" class="col-sm-2 control-label">累计支付金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="cumulativePayAmountEditModal_materialGeld" name="cumulativePayAmount" readonly="true" maxLength="30" autocomplete="off" placeholder="" title="累计支付金额">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="noPayAmountEditModal_materialGeld" class="col-sm-2 control-label">未付款金额:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control required" id="noPayAmountEditModal_materialGeld" name="noPayAmount" readonly="true" maxLength="30" autocomplete="off" placeholder="" title="未付款金额">
                    </div>
                    <label for="isAutoTransferEditModal_materialGeld" class="col-sm-2 control-label">是否自动转入:</label>
                    <div class="col-sm-4">
                        <select id="isAutoTransferEditModal_materialGeld" class="input-sm col-md-12" title="是否自动转入" >
                            <option value="1">是</option>
                            <option value="2">否</option>
                        </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="remarkEditModal_materialGeld" class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control ipt_content_left" id="remarkEditModal_materialGeld" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="editMaterialGeldModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Remove MaterialGeld modal dialog -->
<div id="removeMaterialGeldModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">删除材料支付款信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <p>确定删除该材料支付款信息？</p>
            </div>
            <div class="modal-footer">
                <button id="removeMaterialGeldModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var oldPayAmount=0;
    var oldCumulativePayAmount=0;
    var oldNoPayAmount=0;
    $(document).ready(function () {

        $("#addMaterialGeldModalSubmit").click(function(){
            addMaterialGeld();
        });
        $("#editMaterialGeldModalSubmit").click(function(){
            editMaterialGeld();
        });
        $("#removeMaterialGeldModalSubmit").click(function(){
            deleteMaterialGeld();
        });

        // 为输入金额项绑定按下按键事件（只能输入数字和小数点）
        $("input[id$='Modal_materialGeld']").keyup(function () {
            if (isFormatIptData_materialGeld($(this).attr("id"))) {
                clearNoNumOfAlert($(this));
            }
        });

        // 为输入金额项绑定获得焦点事件(去除千分号)
        $("input[id$='Modal_materialGeld']").focus(function () {
            if ($(this).val() != "" && isFormatIptData_materialGeld($(this).attr("id"))) {
                $(this).val(formatAmountValue($(this).val(), false));
            }
        });

        //计算 累计支付金额 和 未支付金额 -add
        $("#payAmountAddModal_materialGeld").blur(function () {
            var payAmountTotal=parseFloat(formatAmountValue($("#pay_Amount_Total").val(),false));
            var noPayAmountTotal=parseFloat(formatAmountValue($("#noPay_Amount_Total").val(),false));
            var contractAmount=parseFloat(formatAmountValue($("#contract_Amount").val(),false));
            if($(this).val() != ""){
                var payAmount=parseFloat(formatAmountValue($(this).val(), false));
                $("#cumulativePayAmountAddModal_materialGeld").val(formatAmountValue(payAmountTotal+payAmount,true));
                $("#noPayAmountAddModal_materialGeld").val(formatAmountValue(contractAmount-(payAmountTotal+payAmount),true));
            }
        });

        //计算 累计支付金额 和 未支付金额 --edit
        $("#payAmountEditModal_materialGeld").blur(function () {
            var payAmountTotal=parseFloat(formatAmountValue($("#pay_Amount_Total").val(),false));
            var noPayAmountTotal=parseFloat(formatAmountValue($("#noPay_Amount_Total").val(),false));
            var contractAmount=parseFloat(formatAmountValue($("#contract_Amount").val(),false));
            if($(this).val() != ""){
                var payAmount=parseFloat(formatAmountValue($(this).val(), false))
                if(payAmount!=oldPayAmount){
                    var differVal=payAmount-oldPayAmount;//本次修改 和原支付金额的差值
                    var cumulativePayAmount=parseFloat(formatAmountValue($("#cumulativePayAmountEditModal_materialGeld").val(),false));
                    var noPayAmount=parseFloat(formatAmountValue($("#noPayAmountEditModal_materialGeld").val(),false));
                    $("#cumulativePayAmountEditModal_materialGeld").val(formatAmountValue(oldCumulativePayAmount+differVal,true));
                    $("#noPayAmountEditModal_materialGeld").val(formatAmountValue(oldNoPayAmount-differVal,true));
                }
            }
        });

        // 为输入金额项绑定失去焦点事件（添加千分号）
        $("input[id$='Modal_materialGeld']").blur(function () {
            if ($(this).val() != "" && isFormatIptData_materialGeld($(this).attr("id"))) {
                $(this).val(formatAmountValue($(this).val(), true));
                // 如果是支付金额，需要再次确认输入的值
                var idName = $(this).attr("id");
                if (idName == "payAmountAddModal_materialGeld" || idName == "payAmountEditModal_materialGeld") {
                    againInputAmount($(this));
                }
            }
        });

    });

    function getMaterialGeld(id){
        $.post(baseUrl + '/op/materialGeld/getInfo', {id: id}, function (response) {
            $("#materialContractId").val(response.materialContractId);
            $("#materialGeldId_materialGeld").val(id);
            $("#summaryEditModal_materialGeld").val(response.summary);
            $("#payDateEditModal_materialGeld").val(response.payDate);
            $("#payAmountEditModal_materialGeld").val(response.payAmount);
            $("#cumulativePayAmountEditModal_materialGeld").val(response.cumulativePayAmount);
            $("#noPayAmountEditModal_materialGeld").val(response.noPayAmount);
            $("#isAutoTransferEditModal_materialGeld").val(response.isAutoTransfer);
            $("#remarkEditModal_materialGeld").val(response.remark);

            oldPayAmount=parseFloat(formatAmountValue(response.payAmount,false));//修改的时候 原本支付金额
            oldCumulativePayAmount=parseFloat(formatAmountValue(response.cumulativePayAmount));
            oldNoPayAmount=parseFloat(formatAmountValue(response.noPayAmount));
        }, 'json');
    }

    function addMaterialGeld(){
        if(!materialGeldFormValidate('Add')){
            return;
        }
        $.post(baseUrl + '/op/materialGeld/saveInfo', getMaterialGeldParams('Add'), function (response){
            if(response.result){
                alert("保存成功");
                $("#addMaterialGeldModal").modal('hide');
                refreshTable('materialGeld');
                refreshTable('materialContract');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function editMaterialGeld(){
        if(!materialGeldFormValidate('Edit')){
            return;
        }
        $.post(baseUrl + '/op/materialGeld/updateInfo', getMaterialGeldParams('Edit'), function (response){
            if(response.result){
                alert("保存成功");
                $("#editMaterialGeldModal").modal('hide');
                refreshTable('materialGeld');
                refreshTable('materialContract');
            }else{
                alert("保存失败!");
            }
        }, 'json');
    }

    function getMaterialGeldParams(op) {
        return {
            data: JSON.stringify({
                projectId: $("#projectId").val(),
                materialContractId: $("#materialContractId").val(),
                materialGeldId: $("#materialGeldId_materialGeld").val(),
                summary: $("#summary" + op + "Modal_materialGeld").val(),
                payDate: $("#payDate" + op + "Modal_materialGeld").val(),
                payAmount: $("#payAmount" + op + "Modal_materialGeld").val(),
                cumulativePayAmount: $("#cumulativePayAmount" + op + "Modal_materialGeld").val(),
                noPayAmount: $("#noPayAmount" + op + "Modal_materialGeld").val(),
                isAutoTransfer: $("#isAutoTransfer" + op + "Modal_materialGeld").val(),
                remark: $("#remark" + op + "Modal_materialGeld").val()
            })
        };
    }

    function deleteMaterialGeld() {
        var id = $("#materialGeldId_materialGeld").val();
        $.post(baseUrl + '/op/materialGeld/delete', {id: id}, function (response) {
            if (response.result) {
                alert("删除成功");
                $("#removeMaterialGeldModal").modal('hide');
                refreshTable('materialGeld');
                refreshTable('materialContract');
            } else {
                alert("删除失败!");
            }
        }, 'json');
    }

    // 材料支付款表单验证
    function materialGeldFormValidate(op) {
        var formInfos = $(".materialGeld" + op + "Modal .required");
        for (var i = 0; i < formInfos.length; i++) {
            var idName = formInfos[i].id;
            var titleName = formInfos[i].title;
            var $ipt = $("#" + idName);
            var iptValue = $ipt.val();
            if (iptValue == "") {
                alert("请输入" + titleName + "!");
                $ipt.focus();
                return false;
            }
        }
        return true;
    }

    function isFormatIptData_materialGeld(objId){
        var index = objId.indexOf("AddModal");
        if(index <= 0){
            index = objId.indexOf("EditModal");
        }
        var objField = objId.substring(0,index);
        if(objField == "summary" || objField == "payDate" || objField == "isAutoTransfer" || objField == "remark"){
            return false;
        }
        return true;
    }


</script>