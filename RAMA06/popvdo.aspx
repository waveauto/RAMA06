<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="popvdo.aspx.vb" Inherits="RAMA06.popvdo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   
            <div class="table-responsive">
                <div class="text-center">
                    <asp:DataList ID="DataList1" Visible="true" runat="server" AutoGenerateColumns="false"
                        RepeatColumns="1" Width="100%" CellSpacing="100" CellPadding="5" class="vex-res">
                        <ItemTemplate>
                            <hr />
                            <u>
                                <%# Eval("headname")%></u>
                            <p></p>
                            <hr />

                            <div class="col-xs-6 col-sm-3">
                                <a class="player" style="height: 500px; width: 785px; display: block" href='<%# Eval("PopID", "popupVideoHandler.ashx?Id={0}")%>'></a>
                            </div>

                        </ItemTemplate>
                    </asp:DataList>
                    <script src="FlowPlayer/flowplayer-3.2.12.min.js" type="text/javascript"></script>
                    <script type="text/javascript">
                        flowplayer("a.player", "FlowPlayer/flowplayer-3.2.16.swf", {
                            plugins: {
                                pseudo: { url: "FlowPlayer/flowplayer.pseudostreaming-3.2.12.swf" }
                            },
                            clip: { provider: 'pseudo', autoPlay: false },
                        });
                    </script>
                </div>
            </div>
            <p></p>
     
    </form>
</body>
</html>
