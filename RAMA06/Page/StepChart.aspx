<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="StepChart.aspx.vb" Inherits="RAMA06.StepChart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .text-wrap {
            white-space: normal;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<div class ="text-center"><h2>การติดตามงาน</h2></div>
<div class ="text-right"> </div>
<br />
    <div class="panel panel-primary">

        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <br />
                    <div class="row">
                        <div class="col-xs-1"></div>
                        <div class="col-xs-11">
                            <div class="lead text-center btn alert alert-info text-info center-block"><h3>เอกสารฉบับร่าง (xx)</h3></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-1"></div>
                        <div class="col-xs-2 text-center">
                            <p class="btn">
                                <span class="glyphicon glyphicon-arrow-down"></span>
                            </p>
                        </div>
                        <div class="col-xs-2 text-center">
                            <p class="btn">
                                <span class="glyphicon glyphicon-arrow-down"></span>
                            </p>
                        </div>
                        <div class="col-xs-2 text-center">
                            <p class="btn">
                                <span class="glyphicon glyphicon-arrow-down"></span>
                            </p>
                        </div>
                        <div class="col-xs-3 text-center">
                            <p class="btn">
                                <span class="glyphicon glyphicon-arrow-down"></span>
                            </p>
                        </div>
                        <div class="col-xs-2 text-center">
                            <p class="btn">
                                <span class="glyphicon glyphicon-arrow-down"></span>
                            </p>
                        </div>

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-1"></div>
                <div class="col-xs-2 text-left">
                    <p class="center-block"><span class="btn btn-primary btn-lg">เอกสารชุด ว. (xx)<a href="RecordAll.aspx">...</a></span></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="bg-info text-primary btn">แจ้งเอกสารไม่ผ่าน (xx)</p>
                    <p class="bg-info text-primary btn"><a href="RecordAll.aspx">...</a></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="center-block"><span class="btn btn-primary btn-sm">กำหนดชื่อกรรมการ (xx)<a href="RecordAll.aspx">...</a></span></p>
                    <p class="center-block"><span class="btn btn-primary btn-sm">กรรมการพิจารณา (xx)<a href="RecordAll.aspx">...</a></span></p>
                    <p class="center-block"><span class="btn btn-primary btn-sm">เจ้าหน้าที่สรุปผล (xx)<a href="RecordAll.aspx">...</a></span></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="bg-info text-primary btn">แจ้ง EC ไม่ผ่าน/ผ่าน<br />แบบมีเงื่อนไข(xx)</p>
                    <p class="bg-info text-primary btn"><a href="RecordAll.aspx">...</a></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                </div>
                <div class="col-xs-2 text-left">
                    <p class="center-block"><span class="btn btn-primary btn-lg">เอกสารชุด ย. (xx)</span></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="bg-info text-primary btn">แจ้งเอกสารไม่ผ่าน (xx)</p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="center-block"><span class="btn btn-primary btn-sm">กำหนดชื่อกรรมการ (xx)</span></p>
                    <p class="center-block"><span class="btn btn-primary btn-sm">กรรมการพิจารณา (xx)</span></p>
                    <p class="center-block"><span class="btn btn-primary btn-sm">เจ้าหน้าที่สรุปผล (xx)</span></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="bg-info text-primary btn">แจ้ง EC ไม่ผ่าน/ผ่าน<br />แบบมีเงื่อนไข(xx)</p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                </div>
                <div class="col-xs-2 text-left">
                    <p class="center-block"><span class="btn btn-primary btn-lg">เอกสารชุด ท. (xx)</span></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="bg-info text-primary btn">แจ้งเอกสารไม่ผ่าน (xx)</p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="center-block"><span class="btn btn-primary btn-sm">กำหนดชื่อกรรมการ (xx)</span></p>
                    <p class="center-block"><span class="btn btn-primary btn-sm">กรรมการพิจารณา (xx)</span></p>
                    <p class="center-block"><span class="btn btn-primary btn-sm">เจ้าหน้าที่สรุปผล (xx)</span></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="bg-info text-primary btn">แจ้ง EC ไม่ผ่าน/ผ่าน<br />แบบมีเงื่อนไข(xx)</p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                </div>
                <div class="col-xs-3 text-left">
                    <p class="center-block"><span class="btn btn-primary btn-lg">วิจัยอื่นๆ(เช่น Case Report)(xx)</span></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="bg-info text-primary btn">แจ้งเอกสารไม่ผ่าน (xx)</p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="center-block"><span class="btn btn-primary btn-sm">กำหนดชื่อกรรมการ (xx)</span></p>
                    <p class="center-block"><span class="btn btn-primary btn-sm">กรรมการพิจารณา (xx)</span></p>
                    <p class="center-block"><span class="btn btn-primary btn-sm">เจ้าหน้าที่สรุปผล (xx)</span></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="bg-info text-primary btn">แจ้ง EC ไม่ผ่าน/ผ่านแบบมีเงื่อนไข(xx)</p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                </div>
                <div class="col-xs-2 text-left">
                    <p class="center-block"><span class="btn btn-primary btn-lg">เอกสาร R2R(xx)</span></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="bg-info text-primary btn">แจ้งเอกสารไม่ผ่าน (xx)</p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="center-block"><span class="btn btn-primary btn-sm">กำหนดชื่อกรรมการ (xx)</span></p>
                    <p class="center-block"><span class="btn btn-primary btn-sm">กรรมการพิจารณา (xx)</span></p>
                    <p class="center-block"><span class="btn btn-primary btn-sm">เจ้าหน้าที่สรุปผล (xx)</span></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="bg-info text-primary btn">แจ้ง EC ไม่ผ่าน/ผ่าน<br />แบบมีเงื่อนไข(xx)</p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                </div>

            </div>

            <div class="row" style="padding:10px 0px 10px 0px;">
                <div class="col-xs-12">
                    <div class="row">
                        <div class="col-xs-1"></div>
                        <div class="col-xs-11">
                            <div class="lead text-center btn alert alert-warning center-block"><h3>ทุน</h3></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-1"></div>
                <div class="col-xs-2 text-left">
                    <p class="center-block"><span class="btn btn-warning btn-lg">ทุนรัฐบาล ว. (xx)<a href="RecordAll.aspx">...</a></span></p>
                    <p class="center-block"><span class="btn btn-warning btn-sm">กำหนดชื่อกรรมการ (xx)<a href="RecordAll.aspx">...</a></span></p>
                    <p class="center-block"><span class="btn btn-warning btn-sm">กรรมการพิจารณา (xx)<a href="RecordAll.aspx">...</a></span></p>
                    <p class="center-block"><span class="btn btn-warning btn-sm">เจ้าหน้าที่สรุปผล (xx)</span></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="bg-warning text-warning btn">แจ้ง ทุน ไม่ผ่าน/ผ่าน<br />แบบมีเงื่อนไข(xx)</p>
                    <p class="bg-warning text-warning btn"><a href="RecordAll.aspx">...</a></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                </div>
                <div class="col-xs-2 text-left">
                    <p class="center-block"><span class="btn btn-warning btn-lg">ทุนเอกชน (xx)</span></p>
                    <p class="center-block"><span class="btn btn-warning btn-sm">กำหนดชื่อกรรมการ (xx)</span></p>
                    <p class="center-block"><span class="btn btn-warning btn-sm">กรรมการพิจารณา (xx)</span></p>
                    <p class="center-block"><span class="btn btn-warning btn-sm">เจ้าหน้าที่สรุปผล (xx)</span></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="bg-warning text-warning btn">แจ้ง ทุน ไม่ผ่าน/ผ่าน<br />แบบมีเงื่อนไข(xx)</p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                </div>
                <div class="col-xs-2 text-left">
                    <p class="center-block"><span class="btn btn-warning btn-lg">ทุนภายในคณะ (xx)</span></p>
                    <p class="center-block"><span class="btn btn-warning btn-sm">กำหนดชื่อกรรมการ (xx)</span></p>
                    <p class="center-block"><span class="btn btn-warning btn-sm">กรรมการพิจารณา (xx)</span></p>
                    <p class="center-block"><span class="btn btn-warning btn-sm">เจ้าหน้าที่สรุปผล (xx)</span></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="bg-warning text-warning btn">แจ้ง ทุน ไม่ผ่าน/ผ่าน<br />แบบมีเงื่อนไข(xx)</p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                </div>
                <div class="col-xs-3 text-left">
                    
                </div>
                <div class="col-xs-2 text-left">
                    <p class="center-block"><span class="btn btn-warning btn-lg">ทุนภายนอก</span></p>
                    <p class="center-block"><span class="btn btn-warning btn-sm">กำหนดชื่อกรรมการ (xx)</span></p>
                    <p class="center-block"><span class="btn btn-warning btn-sm">กรรมการพิจารณา (xx)</span></p>
                    <p class="center-block"><span class="btn btn-warning btn-sm">เจ้าหน้าที่สรุปผล (xx)</span></p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    <p class="bg-warning text-warning btn">แจ้ง EC ไม่ผ่าน/ผ่าน<br />แบบมีเงื่อนไข(xx)</p>
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                </div>

            </div>

            <div class="row">
                <div class="col-xs-1"></div>
                <div class="col-xs-2 text-left">
                    <p class="center-block"><span class="btn btn-success btn-lg">อนุมัติการทำวิจัย (xx)<a href="RecordAll.aspx">...</a></span></p>
                    <div>
                        <p class="bg-success text-success">
                            <a href="#">รายงานก้าวหน้า ครั้งที่ 1 (xx)</a>
                            <a href="#">ชำระเงินทุน งวดที่ 1 (xx)</a>
                        </p>
                    </div>

                    <div>
                        <p class="bg-success text-success">
                            <a href="#">รายงานก้าวหน้า ครั้งที่ 2 (xx)</a>
                            <a href="#">ชำระเงินทุน งวดที่ 2 (xx)</a>
                        </p>
                    </div>

                    <div>
                        <p class="bg-success text-success">
                            <a href="#">รายงานก้าวหน้า ครั้งที่ 3 (xx)</a>
                            <a href="#">ชำระเงินทุน งวดที่ 3 (xx)</a>
                        </p>
                    </div>
                        
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    
                </div>
                  <div class="col-xs-2 text-left">
                    <p class="center-block"><span class="btn btn-success btn-lg">อนุมัติการทำวิจัย (xx)</span></p>
                    <div>
                        <p class="bg-success text-success">
                            <a href="#">รายงานก้าวหน้า ครั้งที่ 1 (xx)</a>
                            <a href="#">ชำระเงินทุน งวดที่ 1 (xx)</a>
                        </p>
                    </div>

                    <div>
                        <p class="bg-success text-success">
                            <a href="#">รายงานก้าวหน้า ครั้งที่ 2 (xx)</a>
                            <a href="#">ชำระเงินทุน งวดที่ 2 (xx)</a>
                        </p>
                    </div>

                    <div>
                        <p class="bg-success text-success">
                            <a href="#">รายงานก้าวหน้า ครั้งที่ 3 (xx)</a>
                            <a href="#">ชำระเงินทุน งวดที่ 3 (xx)</a>
                        </p>
                    </div>
                        
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    
                </div>
                  <div class="col-xs-2 text-left">
                    <p class="center-block"><span class="btn btn-success btn-lg">อนุมัติการทำวิจัย (xx)</span></p>
                    <div>
                        <p class="bg-success text-success">
                            <a href="#">รายงานก้าวหน้า ครั้งที่ 1 (xx)</a>
                            <a href="#">ชำระเงินทุน งวดที่ 1 (xx)</a>
                        </p>
                    </div>

                    <div>
                        <p class="bg-success text-success">
                            <a href="#">รายงานก้าวหน้า ครั้งที่ 2 (xx)</a>
                            <a href="#">ชำระเงินทุน งวดที่ 2 (xx)</a>
                        </p>
                    </div>

                    <div>
                        <p class="bg-success text-success">
                            <a href="#">รายงานก้าวหน้า ครั้งที่ 3 (xx)</a>
                            <a href="#">ชำระเงินทุน งวดที่ 3 (xx)</a>
                        </p>
                    </div>
                        
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    
                </div>
                <div class="col-xs-3 text-left">
                    
                </div>
                  <div class="col-xs-2 text-left">
                    <p class="center-block"><span class="btn btn-success btn-lg">อนุมัติการทำวิจัย (xx)</span></p>
                    <div>
                        <p class="bg-success text-success">
                            <a href="#">รายงานก้าวหน้า ครั้งที่ 1 (xx)</a>
                            <a href="#">ชำระเงินทุน งวดที่ 1 (xx)</a>
                        </p>
                    </div>

                    <div>
                        <p class="bg-success text-success">
                            <a href="#">รายงานก้าวหน้า ครั้งที่ 2 (xx)</a>
                            <a href="#">ชำระเงินทุน งวดที่ 2 (xx)</a>
                        </p>
                    </div>

                    <div>
                        <p class="bg-success text-success">
                            <a href="#">รายงานก้าวหน้า ครั้งที่ 3 (xx)</a>
                            <a href="#">ชำระเงินทุน งวดที่ 3 (xx)</a>
                        </p>
                    </div>
                        
                    <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                    
                </div>

            </div>

            <div class="row">
                <div class="col-xs-1"></div>
                <div class="col-xs-2 text-left">
                    <p class="center-block"><span class="btn btn-success">เอกสารฉบับสมบูรณ์ (xx)</span></p>
                </div>
                <div class="col-xs-2 text-left">
                    <p class="center-block"><span class="btn btn-success">เอกสารฉบับสมบูรณ์ (xx)</span></p>
                </div>
                <div class="col-xs-2 text-left">
                    <p class="center-block"><span class="btn btn-success">เอกสารฉบับสมบูรณ์ (xx)</span></p>
                </div>
                <div class="col-xs-3 text-left">
                    
                </div>
                <div class="col-xs-2 text-left">
                    <p class="center-block"><span class="btn btn-success">เอกสารฉบับสมบูรณ์</span></p>
                </div>

            </div>

            <div class="row" style="padding:10px 0px 10px 0px;">
                <div class="col-xs-12">
                    <div class="row">
                        <div class="col-xs-1"></div>
                        <div class="col-xs-11">
                            <p class="text-center center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
                            <div class="lead text-center btn alert alert-success center-block"><h3>เสร็จสิ้น (xx)</h3>
                                <h3><a href="RecordAll.aspx">...</a></h3></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

            
            
        
    </div> 


</asp:Content>
