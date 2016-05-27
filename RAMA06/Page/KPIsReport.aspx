<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="KPIsReport.aspx.vb" Inherits="RAMA06.KPIsReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 76px;
            height: 86px;
        }
        .auto-style3 {
            height: 36px;
        }
        .auto-style4 {
            height: 83.25pt;
            width: 64pt;
            font-size: 18.0pt;
            color: black;
            font-weight: 700;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border-left: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-top: .5pt solid windowtext;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: medium;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style5 {
            width: 410pt;
            font-size: 18.0pt;
            color: black;
            font-weight: 700;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border-left: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-top: .5pt solid windowtext;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: medium;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style6 {
            width: 86pt;
            font-size: 18.0pt;
            color: black;
            font-weight: 700;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style7 {
            width: 76pt;
            font-size: 18.0pt;
            color: black;
            font-weight: 700;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style8 {
            width: 85pt;
            font-size: 18.0pt;
            color: black;
            font-weight: 700;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border-left: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-top: .5pt solid windowtext;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: medium;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style9 {
            width: 94pt;
            font-size: 18.0pt;
            color: red;
            font-weight: 700;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: right;
            vertical-align: middle;
            white-space: normal;
            border-left: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-top: .5pt solid windowtext;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: medium;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style10 {
            width: 80pt;
            font-size: 18.0pt;
            color: black;
            font-weight: 700;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style11 {
            width: 81pt;
            font-size: 18.0pt;
            color: black;
            font-weight: 700;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style12 {
            height: 31.5pt;
            color: black;
            font-size: 16.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "TH Niramit AS";
            text-align: center;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .auto-style13 {
            width: 410pt;
            color: black;
            font-size: 16.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "TH Niramit AS";
            text-align: left;
            vertical-align: top;
            white-space: normal;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .auto-style14 {
            color: black;
            font-size: 16.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "TH Niramit AS";
            text-align: center;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .auto-style15 {
            color: black;
            font-size: 16.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "TH Niramit AS";
            text-align: general;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .auto-style16 {
            color: black;
            font-size: 16.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "TH Niramit AS";
            text-align: right;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .auto-style17 {
            color: red;
            font-size: 20.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "TH Niramit AS";
            text-align: right;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .auto-style18 {
            height: 31.5pt;
            font-size: 16.0pt;
            color: black;
            font-weight: 700;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: center;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style19 {
            width: 410pt;
            font-size: 16.0pt;
            color: black;
            font-weight: 400;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: left;
            vertical-align: top;
            white-space: normal;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style20 {
            font-size: 16.0pt;
            color: black;
            font-weight: 400;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: center;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style21 {
            font-size: 16.0pt;
            color: black;
            font-weight: 400;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: general;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style22 {
            font-size: 16.0pt;
            color: black;
            font-weight: 400;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: right;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style23 {
            font-size: 20.0pt;
            color: red;
            font-weight: 700;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: right;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style24 {
            height: 58.5pt;
            color: black;
            font-size: 16.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "TH Niramit AS";
            text-align: center;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .auto-style25 {
            color: red;
            font-size: 18.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "TH Niramit AS";
            text-align: right;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .auto-style26 {
            height: 49.5pt;
            font-size: 16.0pt;
            color: black;
            font-weight: 700;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: center;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style27 {
            font-size: 18.0pt;
            color: red;
            font-weight: 700;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: right;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style28 {
            height: 27.75pt;
            color: black;
            font-size: 16.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "TH Niramit AS";
            text-align: center;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .auto-style29 {
            height: 27.75pt;
            font-size: 16.0pt;
            color: black;
            font-weight: 700;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: center;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #F2DCDB;
        }
        .auto-style30 {
            height: 49.5pt;
            color: black;
            font-size: 16.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "TH Niramit AS";
            text-align: center;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .auto-style31 {
            height: 27.75pt;
            font-size: 16.0pt;
            color: black;
            font-weight: 700;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: center;
            vertical-align: bottom;
            white-space: nowrap;
            border-left: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-top: .5pt solid windowtext;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: medium;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .auto-style32 {
            width: 410pt;
            font-size: 16.0pt;
            color: black;
            font-weight: 400;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: left;
            vertical-align: top;
            white-space: normal;
            border-left: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-top: .5pt solid windowtext;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: medium;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .auto-style33 {
            font-size: 16.0pt;
            color: black;
            font-weight: 400;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: center;
            vertical-align: bottom;
            white-space: nowrap;
            border-left: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-top: .5pt solid windowtext;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: medium;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .auto-style34 {
            font-size: 16.0pt;
            color: black;
            font-weight: 400;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: general;
            vertical-align: bottom;
            white-space: nowrap;
            border-left: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-top: .5pt solid windowtext;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: medium;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .auto-style35 {
            font-size: 16.0pt;
            color: black;
            font-weight: 400;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: right;
            vertical-align: bottom;
            white-space: nowrap;
            border-left: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-top: .5pt solid windowtext;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: medium;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .auto-style36 {
            font-size: 18.0pt;
            color: red;
            font-weight: 700;
            text-decoration: none;
            font-family: "TH Niramit AS";
            font-style: normal;
            text-align: right;
            vertical-align: bottom;
            white-space: nowrap;
            border-left: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-top: .5pt solid windowtext;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: medium;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
       <div class ="text-center"><h2>รายงานผลการดำเนินงานตาม : ยุทธศาสตร์ที่ 1 Excellence in research with global and social impact</h2> <br />
           <h2>ประจำปี พ.ศ. 2559</h2>  </div>
  <br />       


    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:
 collapse;width:1057pt" width="1408">
        <colgroup>
            <col style="mso-width-source:userset;mso-width-alt:3108;width:64pt" width="85" />
            <col style="mso-width-source:userset;mso-width-alt:20004;width:410pt" width="547" />
            <col style="mso-width-source:userset;mso-width-alt:4169;width:86pt" width="114" />
            <col style="mso-width-source:userset;mso-width-alt:3693;width:76pt" width="101" />
            <col style="mso-width-source:userset;mso-width-alt:4132;width:85pt" width="113" />
            <col style="mso-width-source:userset;mso-width-alt:4571;width:94pt" width="125" />
            <col style="mso-width-source:userset;mso-width-alt:3913;width:80pt" width="107" />
            <col span="2" style="mso-width-source:userset;mso-width-alt:3949;
 width:81pt" width="108" />
        </colgroup>
        <tr height="111">
            <td class="auto-style4" height="111" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="85">ลำดับ</td>
            <td class="auto-style5" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">ข้อตกลงตาม KPIs</td>
            <td class="auto-style6" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="114">หน่วยนับ</td>
            <td class="auto-style7" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="101">ผลการดำเนินการ ปี 2558</td>
            <td class="auto-style8" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="113">เป้าหมาย ปี 2559</td>
            <td class="auto-style9" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="125">ผลการดำเนินการ ปี 2559</td>
            <td class="auto-style10" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="107">เป้าหมาย ปี 2560</td>
            <td class="auto-style11" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="108">เป้าหมาย ปี 2561</td>
            <td class="auto-style11" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="108">เป้าหมาย ปี 2562</td>
        </tr>
        <tr height="42">
            <td class="auto-style12" height="42">1</td>
            <td class="auto-style13" width="547">จำนวนเงินทุนสนับสนุนการวิจัยในปีงบประมาณต่อจำนวนบุคคลากรสายวิชาการ</td>
            <td class="auto-style14">บาท/คน</td>
            <td align="right" class="auto-style15">182,774</td>
            <td class="auto-style16">197,544</td>
            <td class="auto-style17">197,544</td>
            <td align="right" class="auto-style15">202,559</td>
            <td align="right" class="auto-style15">208,065</td>
            <td align="right" class="auto-style15">221,658</td>
        </tr>
        <tr height="42">
            <td class="auto-style18" height="42" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">2</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">จำนวนเงินทุนสนับสนับการวิจัย</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">บาท</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">134,865,017</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">154,677,000</td>
            <td class="auto-style23" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">14,677,000</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">167,516,390</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">179,352,179</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">193,285,687</td>
        </tr>
        <tr height="42">
            <td class="auto-style12" height="42">3</td>
            <td class="auto-style13" width="547">จำนวนเงินทุนวิจัยจากภายในมหาวิทยาลัย</td>
            <td class="auto-style14">บาท</td>
            <td align="right" class="auto-style15">134,865,017</td>
            <td class="auto-style16">29,300,000</td>
            <td class="auto-style17">9,300,000</td>
            <td align="right" class="auto-style15">30,631,818</td>
            <td align="right" class="auto-style15">31,963,636</td>
            <td align="right" class="auto-style15">33,295,455</td>
        </tr>
        <tr height="42">
            <td class="auto-style18" height="42" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">4</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">จำนวนเงินรายได้ส่วนงานที่เป็นทุนวิจัย</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">บาท</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">11,000,432</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">13,043,000</td>
            <td class="auto-style23" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">3,043,000</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">16,303,750</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">19,564,500</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">23,912,167</td>
        </tr>
        <tr height="42">
            <td class="auto-style12" height="42">5</td>
            <td class="auto-style13" width="547">จำนวนเงินทุนวิจัยที่ได้รับจากหน่วยงานภาครัฐภายในประเทศ</td>
            <td class="auto-style14">บาท</td>
            <td align="right" class="auto-style15">39,115,552</td>
            <td class="auto-style16">41,100,000</td>
            <td class="auto-style17">1,100,000</td>
            <td align="right" class="auto-style15">43,321,622</td>
            <td align="right" class="auto-style15">45,543,243</td>
            <td align="right" class="auto-style15">47,764,865</td>
        </tr>
        <tr height="42">
            <td class="auto-style18" height="42" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">6</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">จำนวนเงินทุนวิจัยที่ได้รับจากหน่วยงานภาครัฐต่างประเทศ</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">บาท</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">216,177</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">234,000</td>
            <td class="auto-style23" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">234,000</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">259,200</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">280,800</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">313,200</td>
        </tr>
        <tr height="42">
            <td class="auto-style12" height="42">7</td>
            <td class="auto-style13" width="547">จำนวนเงินทุนวิจัยที่ได้รับจากภาคเอกชนภายในประเทศ</td>
            <td class="auto-style14">บาท</td>
            <td align="right" class="auto-style15">56,061,856</td>
            <td class="auto-style16">71,000,000</td>
            <td class="auto-style17">1,000,000</td>
            <td align="right" class="auto-style15">76,000,000</td>
            <td align="right" class="auto-style15">81,000,000</td>
            <td align="right" class="auto-style15">87,000,000</td>
        </tr>
        <tr height="42">
            <td class="auto-style18" height="42" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">8</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">จำนวนเงินทุนวิจัยที่ได้รับจากภาคเอกชนต่างประเทศ</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">บาท</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style23" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">1,000,000</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">1,000,000</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">1,000,000</td>
        </tr>
        <tr height="42">
            <td class="auto-style12" height="42">9</td>
            <td class="auto-style13" width="547">จำนวนบุคคากรสายวิชาการ</td>
            <td class="auto-style14">บาท</td>
            <td align="right" class="auto-style15">738</td>
            <td class="auto-style16">783</td>
            <td class="auto-style17" style="text-underline-style: none; text-line-through: none;">68</td>
            <td align="right" class="auto-style15">828</td>
            <td align="right" class="auto-style15">862</td>
            <td align="right" class="auto-style15">872</td>
        </tr>
        <tr height="42">
            <td class="auto-style18" height="42" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">10</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">จำนวนอาจารย์</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">บาท</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">737</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">780</td>
            <td class="auto-style23" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">845</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">822</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">855</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">863</td>
        </tr>
        <tr height="78">
            <td class="auto-style24" height="78">11</td>
            <td class="auto-style13" width="547">จำนวนนักวิจัย</td>
            <td class="auto-style14">บาท</td>
            <td align="right" class="auto-style15">1</td>
            <td class="auto-style16">3</td>
            <td class="auto-style25">3</td>
            <td align="right" class="auto-style15">5</td>
            <td align="right" class="auto-style15">7</td>
            <td align="right" class="auto-style15">9</td>
        </tr>
        <tr height="66">
            <td class="auto-style26" height="66" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">12</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">จำนวนบทความตีพิมพ์ในวารสารวิชาการระดับนานาชาติ ที่เป็นที่ยอมรับต่อจำนวนบุคลากรสายวิชาการในการแต่ละปีปฏิทิน</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">(ฉบับ) ชิ้น/คน</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">0.41</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">0.49</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">0.49</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">0.64</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">0.82</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">1.08</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">13</td>
            <td class="auto-style13" width="547">จำนวนบทความตีพิมพ์ในวารสารวิชาการระดับนานาชาติ</td>
            <td class="auto-style14">ชิ้น</td>
            <td align="right" class="auto-style15">305</td>
            <td class="auto-style16">585</td>
            <td class="auto-style25">585</td>
            <td align="right" class="auto-style15">525</td>
            <td align="right" class="auto-style15">710</td>
            <td align="right" class="auto-style15">940</td>
        </tr>
        <tr height="37">
            <td class="auto-style29" height="37" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">14</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">จำนวนดัชนีการอ้างอิงต่อบทความวิจัยในแต่ละปีปฏิทิน</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">(ฉบับ) ครั้ง/ชิ้น</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">5.48</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">6</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">6</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">6.36</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">6.66</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">7.14</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">15</td>
            <td class="auto-style13" width="547">จำนวนดัชนีการอ้างอิง</td>
            <td class="auto-style14">ครั้ง</td>
            <td align="right" class="auto-style15">2491</td>
            <td class="auto-style16">3000</td>
            <td class="auto-style25">3000</td>
            <td align="right" class="auto-style15">3500</td>
            <td align="right" class="auto-style15">4000</td>
            <td align="right" class="auto-style15">5000</td>
        </tr>
        <tr height="37">
            <td class="auto-style29" height="37" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">16</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">จำนวนบทความวิจัย</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">ชิ้น</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">454</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">500</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">500</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">550</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">600</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">700</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">17</td>
            <td class="auto-style13" width="547">จำนวนสัญญาโครงการวิจัยที่มีการถ่ายทอดเทคโนโลยีหรือองค์ความรู้ต่อภาครัฐ/เอกชน</td>
            <td class="auto-style14">ฉบับ/ปี</td>
            <td align="right" class="auto-style15">62</td>
            <td class="auto-style16">128</td>
            <td class="auto-style25">128</td>
            <td align="right" class="auto-style15">155</td>
            <td align="right" class="auto-style15">180</td>
            <td align="right" class="auto-style15">205</td>
        </tr>
        <tr height="66">
            <td class="auto-style26" height="66" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">18</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">จำนวนสัญญาโครงการวิจัย/ผลงานวิจัย/ผลงานทางวิชาการที่มีการถ่ายทอดเทคโนโลยีหรือองค์ความรู้ต่อภาครัฐ</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">ฉบับ</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">31</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">38</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">38</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">45</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">50</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">55</td>
        </tr>
        <tr height="66">
            <td class="auto-style30" height="66">19</td>
            <td class="auto-style13" width="547">จำนวนสัญญาโครงการวิจัย/ผลงานวิจัย/ผลงานทางวิชาการที่มีการถ่ายทอดเทคโนโลยีหรือองค์ความรู้ต่อภาคเอกชน</td>
            <td class="auto-style14">ฉบับ</td>
            <td align="right" class="auto-style15">31</td>
            <td class="auto-style16">40</td>
            <td class="auto-style25">40</td>
            <td align="right" class="auto-style15">50</td>
            <td align="right" class="auto-style15">60</td>
            <td align="right" class="auto-style15">70</td>
        </tr>
        <tr height="66">
            <td class="auto-style26" height="66" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">20</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">จำนวนสัญญาโครงการวิจัย/ผลงานวิจัย/ผลงานทางวิชาการที่ทำให้มหาวิทยาลัยมหิดลมีรายได้</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">ฉบับ</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">50</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">50</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">60</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">70</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">80</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">21</td>
            <td class="auto-style13" width="547">ระดับความผึงพอใจของแหล่งทุนภาครัฐในแต่ละปีงบประมาณ</td>
            <td class="auto-style14">ระดับเต็ม 5</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style16">3</td>
            <td class="auto-style25">3</td>
            <td align="right" class="auto-style15">4</td>
            <td align="right" class="auto-style15">4</td>
            <td align="right" class="auto-style15">4</td>
        </tr>
        <tr height="66">
            <td class="auto-style26" height="66" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">22</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">จำนวนเงินจากการรับจ้างวิจัย(ไม่นับการบริการวิชาการ เช่น เป็นที่ปรึกษา ออกแบบ วางระบบ ฝึกอบรม สัมมนา หรือการวิเคราะห์ทางห้องปฏิบัติการเป็นต้น)</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">บาท</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">13,682,215</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">15,000,000</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">15,000,000</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">17,000,000</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">19,000,000</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">21,000,000</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">23</td>
            <td class="auto-style13" width="547">จำนวนผลงานวิจัยที่ได้รับการตีพิมพ์ในวารระดับชาติ</td>
            <td class="auto-style14">เรื่อง (ไม่นับซ้ำ)</td>
            <td align="right" class="auto-style15">90</td>
            <td class="auto-style16">110</td>
            <td class="auto-style25">10</td>
            <td align="right" class="auto-style15">120</td>
            <td align="right" class="auto-style15">130</td>
            <td align="right" class="auto-style15">140</td>
        </tr>
        <tr height="37">
            <td class="auto-style29" height="37" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">24</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">ค่า h-index ของส่วนงาน</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">จำนวน</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">29</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">30</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">10</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">35</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">40</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">45</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">25</td>
            <td class="auto-style13" width="547">จำนวนผลงานวิจัยที่ก่อให้เกิดทรัพย์สินทางปัญญา</td>
            <td class="auto-style14">ชิ้น/เรื่อง</td>
            <td align="right" class="auto-style15">20</td>
            <td class="auto-style16">26</td>
            <td class="auto-style25">6</td>
            <td align="right" class="auto-style15">27</td>
            <td align="right" class="auto-style15">44</td>
            <td align="right" class="auto-style15">44</td>
        </tr>
        <tr height="37">
            <td class="auto-style29" height="37" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">26</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">สิทธิบัตร</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">ชิ้น/เรื่อง</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">1</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">1</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">2</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">4</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">4</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">27</td>
            <td class="auto-style13" width="547">อนุสิทธิบัตร</td>
            <td class="auto-style14">ชิ้น/เรื่อง</td>
            <td align="right" class="auto-style15">1</td>
            <td class="auto-style16">5</td>
            <td class="auto-style25">1</td>
            <td align="right" class="auto-style15">5</td>
            <td align="right" class="auto-style15">10</td>
            <td align="right" class="auto-style15">10</td>
        </tr>
        <tr height="37">
            <td class="auto-style29" height="37" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">28</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">ความลับทางการค้า</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">ชิ้น/เรื่อง</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">29</td>
            <td class="auto-style13" width="547">เครื่องหมายการค้า</td>
            <td class="auto-style14">ชิ้น/เรื่อง</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style25" style="text-underline-style: none; text-line-through: none;">3</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
        </tr>
        <tr height="37">
            <td class="auto-style29" height="37" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">30</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">สิ่งบ่งชี้ทางภูมิศาสตร์</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">ชิ้น/เรื่อง</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">31</td>
            <td class="auto-style13" width="547">แผงผังระบบวงจรรวม</td>
            <td class="auto-style14">ชิ้น/เรื่อง</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style25" style="text-underline-style: none; text-line-through: none;">2</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
        </tr>
        <tr height="37">
            <td class="auto-style29" height="37" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">32</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">คุ้มครองพันธุ์พืช</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">ชิ้น/เรื่อง</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">33</td>
            <td class="auto-style13" width="547">ภูมิปัญญาท้องถิ่น</td>
            <td class="auto-style14">ชิ้น/เรื่อง</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style25" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
        </tr>
        <tr height="37">
            <td class="auto-style29" height="37" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">34</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">สิทธิบัตร</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">ชิ้น/เรื่อง</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">10</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">10</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">9</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">10</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">15</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">15</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">35</td>
            <td class="auto-style13" width="547">อนุสิทธิบัตร</td>
            <td class="auto-style14">ชิ้น/เรื่อง</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">9</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">10</td>
            <td class="auto-style25" style="text-underline-style: none; text-line-through: none;">12</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">10</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">15</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">15</td>
        </tr>
        <tr height="37">
            <td class="auto-style29" height="37" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">36</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">ความลับทางการค้า</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">ชิ้น/เรื่อง</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">37</td>
            <td class="auto-style13" width="547">เครื่องหมายการค้า</td>
            <td class="auto-style14">ชิ้น/เรื่อง</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style25" style="text-underline-style: none; text-line-through: none;">3</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
        </tr>
        <tr height="37">
            <td class="auto-style29" height="37" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">38</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">สิ่งบ่งชี้ทางภูมิศาสตร์</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">ชิ้น/เรื่อง</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">4</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">39</td>
            <td class="auto-style13" width="547">ผังระบบวงจรรวม</td>
            <td class="auto-style14">ชิ้น/เรื่อง</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style25" style="text-underline-style: none; text-line-through: none;">2</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
        </tr>
        <tr height="37">
            <td class="auto-style29" height="37" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">40</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">คุ้มครองพันธุ์พืช</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">ชิ้น/เรื่อง</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">3</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">-</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">41</td>
            <td class="auto-style13" width="547">ภูมิปัญญาท้องถิ่น</td>
            <td class="auto-style14">ชิ้น/เรื่อง</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style25" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
            <td class="auto-style14" style="text-underline-style: none; text-line-through: none;">-</td>
        </tr>
        <tr height="66">
            <td class="auto-style26" height="66" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">42</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">จำนวนผลงานวิจัยใหม่ที่นำไปสู่การปรับนโยบายการบริหารระดับส่วนงานกระทรวงหรือระดับประเทศและที่มีผลกระทบต่อสังคม</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">ชิ้น ไม่นำซ้ำ</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">5</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">5</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">5</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">8</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">12</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">18</td>
        </tr>
        <tr height="66">
            <td class="auto-style30" height="66">43</td>
            <td class="auto-style13" width="547">สัดส่วนของผลงานวิจัยที่ได้รับการตีพิมพ์ในวารสารวิชาการระดับชาติต่อจำนวนบุคลากรสายวิชาการ</td>
            <td class="auto-style14">เรื่อง/คน</td>
            <td align="right" class="auto-style15">0.12</td>
            <td align="right" class="auto-style15">0.14</td>
            <td class="auto-style25">0.14</td>
            <td align="right" class="auto-style15">0.14</td>
            <td align="right" class="auto-style15">0.15</td>
            <td align="right" class="auto-style15">0.16</td>
        </tr>
        <tr height="37">
            <td class="auto-style29" height="37" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">44</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">จำนวนบทความตีพิมพ์ในวารสารวิชาการระดับชาติ</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">ชิ้น</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">90</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">110</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">10</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">120</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">130</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">140</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">45</td>
            <td class="auto-style13" width="547">จำนวนบุคลากรสายวิชการตำแหน่งอาจารย์</td>
            <td class="auto-style14">คน</td>
            <td align="right" class="auto-style15">737</td>
            <td class="auto-style16">780</td>
            <td class="auto-style25">80</td>
            <td align="right" class="auto-style15">822</td>
            <td align="right" class="auto-style15">855</td>
            <td align="right" class="auto-style15">863</td>
        </tr>
        <tr height="37">
            <td class="auto-style29" height="37" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">46</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">อาจารย์</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">คน</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">393</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">414</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">314</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">426</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">429</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">407</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">47</td>
            <td class="auto-style13" width="547">ผู้ช่วยศาสตราจารย์ (ผศ.)</td>
            <td class="auto-style14">คน</td>
            <td align="right" class="auto-style15">184</td>
            <td class="auto-style16">192</td>
            <td class="auto-style25">92</td>
            <td align="right" class="auto-style15">204</td>
            <td align="right" class="auto-style15">217</td>
            <td align="right" class="auto-style15">230</td>
        </tr>
        <tr height="37">
            <td class="auto-style29" height="37" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">48</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">รองศาสตราจารย์ (รศ.)</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">คน</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">120</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">126</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">126</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">136</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">145</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">154</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">49</td>
            <td class="auto-style13" width="547">ศาสตราจารย์ (ศ.)</td>
            <td class="auto-style14">คน</td>
            <td align="right" class="auto-style15">40</td>
            <td class="auto-style16">48</td>
            <td class="auto-style25">48</td>
            <td align="right" class="auto-style15">56</td>
            <td align="right" class="auto-style15">64</td>
            <td align="right" class="auto-style15">72</td>
        </tr>
        <tr height="37">
            <td class="auto-style29" height="37" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">50</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">สัดส่วนการทำวิจัย ร้อยละ อาจารย์</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">คน</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">53.32</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">53.07</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">43.07</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">51:82</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">50.18</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">47.16</td>
        </tr>
        <tr height="37">
            <td class="auto-style28" height="37">51</td>
            <td class="auto-style13" width="547">สัดส่วนการทำวิจัย ร้อยละ ผศ.</td>
            <td class="auto-style14">คน</td>
            <td align="right" class="auto-style15">24.97</td>
            <td class="auto-style16">24.63</td>
            <td class="auto-style25">4.63</td>
            <td class="auto-style16">24:82</td>
            <td align="right" class="auto-style15">25.38</td>
            <td align="right" class="auto-style15">26.65</td>
        </tr>
        <tr height="37">
            <td class="auto-style29" height="37" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">52</td>
            <td class="auto-style19" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none" width="547">สัดส่วนการทำวิจัย ร้อยละ รศ.</td>
            <td class="auto-style20" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">คน</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">16.28</td>
            <td class="auto-style22" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">16.15</td>
            <td class="auto-style27" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">6.15</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">16:55</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">16.96</td>
            <td align="right" class="auto-style21" style="text-underline-style: none; text-line-through: none; mso-pattern: #F2DCDB none">17.85</td>
        </tr>
        <tr height="37">
            <td class="auto-style31" height="37" style="text-underline-style: none; text-line-through: none;">53</td>
            <td class="auto-style32" style="text-underline-style: none; text-line-through: none;" width="547">สัดส่วนการทำวิจัย ร้อยละ ศ.</td>
            <td class="auto-style33" style="text-underline-style: none; text-line-through: none;">คน</td>
            <td align="right" class="auto-style34" style="text-underline-style: none; text-line-through: none;">5.43</td>
            <td class="auto-style35" style="text-underline-style: none; text-line-through: none;">6.15</td>
            <td class="auto-style36" style="text-underline-style: none; text-line-through: none;">4.15</td>
            <td align="right" class="auto-style34" style="text-underline-style: none; text-line-through: none;">6.81</td>
            <td align="right" class="auto-style34" style="text-underline-style: none; text-line-through: none;">7.48</td>
            <td align="right" class="auto-style34" style="text-underline-style: none; text-line-through: none;">8.34</td>
        </tr>
    </table>

<br />
<br />
</asp:Content>
