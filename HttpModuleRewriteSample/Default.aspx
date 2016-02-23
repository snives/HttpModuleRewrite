<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
    </head>
    <body>
        <form id="form1" runat="server">
            <h2>This serves as a sample web page which we will demonstrate performing request and response rewriting using an HttpModule.</h2>

            <p>
                Enter a username, which will demonstrate rewriting the request stream with its uppercase value:<br/>
                <asp:TextBox ID="TBUsername" runat="server" ClientIDMode="Static"></asp:TextBox>
            </p>
            
            <p>
                Enter some text to mark as bold from the text below to demonstrate rewriting the response stream.
                <asp:TextBox ID="TBFind" runat="server" ClientIDMode="Static"></asp:TextBox>
            </p>

            <asp:Button ID="Button1" runat="server" Text="Submit" />

        
            <h2>Sample page data</h2>
            <div id="lipsum">
                <p>
                    Vestibulum cursus mi ex, id efficitur sapien bibendum ut. Proin vel velit a elit sagittis bibendum ac nec ante. Nunc tristique turpis urna, sed ultrices lorem efficitur vitae. Donec ac eros et odio consequat dictum vel eu lorem. Cras elementum malesuada nibh. Pellentesque pretium ultricies ipsum, sit amet accumsan quam maximus id. Nullam sit amet diam quis dolor ultricies feugiat sit amet vitae justo. Vivamus dapibus mauris vel accumsan pharetra. Quisque ullamcorper libero elit, eu imperdiet massa aliquet vel. Vivamus efficitur, metus eu tristique sodales, augue ante interdum elit, eu scelerisque odio urna lobortis lectus. Nulla facilisi. Suspendisse accumsan purus vitae lacus fermentum sollicitudin. Morbi diam odio, sagittis scelerisque diam id, tristique efficitur magna.
                </p>
                <p>
                    Praesent ac pulvinar elit. Nullam malesuada accumsan lobortis. Phasellus sed elit arcu. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus varius risus id sagittis pharetra. Sed nec semper odio. Praesent ac magna ac tortor hendrerit finibus ut iaculis ligula. Curabitur ac elit quis eros luctus dapibus. Ut semper dignissim scelerisque. Praesent quis scelerisque dolor.
                </p>
                <p>
                    Integer blandit ante ante, non malesuada lacus imperdiet eget. Aenean molestie lorem arcu, quis accumsan sapien aliquet nec. Ut venenatis nisl id metus facilisis venenatis. Vivamus eget volutpat purus, id convallis urna. Nunc cursus sit amet arcu eget viverra. Nullam rutrum at ligula in vestibulum. Nulla molestie, tellus non euismod varius, massa mi maximus diam, sit amet faucibus ipsum enim ac nisl. Maecenas placerat nisl quis velit eleifend porta. Pellentesque vel ipsum imperdiet, eleifend est vitae, semper purus. Phasellus in porta tellus. Integer fermentum magna dignissim tortor bibendum tempor. Nulla lobortis ultricies lorem vel facilisis.
                </p>
                <p>
                    Vestibulum vehicula diam sit amet augue tincidunt pellentesque. Mauris non nisl pulvinar, ultrices risus id, aliquam nisi. Nulla facilisi. Aliquam gravida ipsum non pulvinar imperdiet. Donec suscipit ex at sapien gravida tempor. Donec venenatis lorem ut odio euismod, sit amet auctor urna finibus. Donec mollis, arcu sit amet porta ultricies, leo enim blandit tellus, et egestas turpis velit vitae mauris. Nam vehicula accumsan turpis, vel ornare sem malesuada faucibus. Vestibulum quis facilisis diam, aliquam blandit turpis.
                </p>
                <p>
                    Nam at nibh nec arcu bibendum luctus. Pellentesque laoreet purus dignissim libero sagittis, at vestibulum elit euismod. Nullam in nisl non lorem molestie sollicitudin sit amet et metus. Praesent non tincidunt nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis eu fringilla ligula. Suspendisse ullamcorper dignissim quam, in fermentum libero. Nunc erat tortor, pretium ut varius eu, semper non neque.
                </p>
                <p>
                    Nullam leo nisl, blandit vitae metus et, varius hendrerit libero. Morbi a auctor justo. Sed lobortis ipsum in est tristique sollicitudin. Aliquam aliquet aliquam ipsum id tincidunt. Cras pulvinar lorem sed porta lobortis. Phasellus malesuada ligula ut sem mattis, ut ultricies lorem luctus. Nam quis est sodales, porta dui non, suscipit mi.
                </p>
                <p>
                    Donec sodales augue vel mi suscipit, vel interdum enim viverra. Ut lacinia magna magna, eu venenatis mi mollis id. Pellentesque volutpat nulla vitae orci malesuada elementum. Aenean lorem velit, varius vel mauris a, suscipit convallis sapien. Cras at risus pretium neque dignissim vehicula vitae sit amet ipsum. Maecenas porta dapibus ipsum, ut lobortis risus. Sed sollicitudin ac mi at accumsan. Curabitur tincidunt tempor tortor, ac dapibus ex elementum quis. Vivamus ut nibh et est ultricies molestie. Ut arcu erat, lacinia a felis quis, luctus ullamcorper lorem. Curabitur facilisis maximus massa ac tincidunt. Aliquam gravida tristique interdum. Integer pulvinar tincidunt lectus. Proin iaculis elit in enim congue, tincidunt fringilla dolor suscipit. Quisque ultricies ipsum in luctus mattis.
                </p>
                <p>
                    In hac habitasse platea dictumst. Nunc elementum, urna et cursus egestas, libero leo porta nunc, vitae lacinia justo tortor at nisl. In vitae vestibulum lorem. Sed non arcu justo. Duis nec lectus sollicitudin, dapibus mi non, dignissim risus. Vivamus nec enim sit amet lectus efficitur sollicitudin nec ut velit. Pellentesque eget ornare ante. Curabitur felis elit, dictum eget erat in, aliquam porta mauris. Proin iaculis dignissim lectus eu euismod. Vivamus at sagittis erat, sit amet aliquet lacus. Nullam rhoncus, augue id convallis molestie, diam ante consequat orci, id posuere magna turpis non neque. Donec ornare non ex a fringilla. Duis ac porttitor lacus. Etiam feugiat nisi sed ex laoreet, eu tempor nibh luctus.
                </p>
                <p>
                    Nam mi purus, vulputate sed finibus eget, cursus nec magna. Phasellus vitae ex auctor, semper mauris quis, aliquam libero. Nullam egestas aliquet elementum. Etiam aliquam eros risus, vel rhoncus dolor commodo vel. Ut aliquet imperdiet turpis, et ultrices dui pulvinar et. Nullam sodales massa enim, eget sollicitudin enim finibus sit amet. Fusce neque lectus, consequat eget diam eget, mattis molestie odio.
                </p>
                <p>
                    Nam quam odio, auctor non tellus nec, hendrerit condimentum ligula. Pellentesque accumsan dui nec mi tincidunt, ac tristique orci semper. Vivamus nec suscipit augue, id malesuada orci. Morbi non lorem condimentum, mollis lacus eu, laoreet velit. Vestibulum lacinia, massa et aliquam congue, libero ipsum tincidunt felis, a mollis massa tortor id nisi. Pellentesque efficitur commodo iaculis. Nunc vitae urna maximus leo venenatis auctor. Mauris placerat ligula ornare, rutrum nisl sit amet, laoreet dui. Nullam ultricies risus eros, et luctus purus sodales sit amet. Quisque vehicula lacus id laoreet commodo. Mauris et iaculis lorem. Aenean mattis velit ac diam imperdiet, luctus ornare tellus faucibus. Sed porttitor purus id posuere malesuada.
                </p>
                <p>
                    Sed sed lorem vitae eros congue faucibus. Aenean at dignissim dolor. In laoreet et mi at fringilla. Nam blandit elementum ante nec rhoncus. Sed ultrices mattis eros, et consequat mauris imperdiet eget. Nullam mollis, neque in semper rutrum, nisl sem ornare enim, a ultricies sem elit ut neque. Nam in vulputate lectus. Sed in augue nisl. Ut semper venenatis maximus. Etiam pellentesque purus vel fermentum bibendum. Ut suscipit, purus quis vehicula commodo, sem est dignissim magna, et facilisis augue est at lectus. Sed id erat vitae urna bibendum tristique at id eros. Etiam a nisl nulla.
                </p>
                <p>
                    Proin feugiat a ligula congue iaculis. Sed ac sagittis ipsum. Nullam eu urna et ipsum elementum sagittis. Morbi lobortis eget lectus tincidunt finibus. Integer consequat magna magna, ut semper nunc sagittis vel. Fusce nec porta nisl, et vehicula nulla. Aliquam mattis lacus id ligula blandit tincidunt. Duis a hendrerit erat, at luctus erat. Donec ultricies urna purus, eu vestibulum nisi pharetra at. Donec vel consectetur libero. Sed consectetur, neque vel volutpat lobortis, ex mauris suscipit ipsum, a luctus velit ligula a orci. Vivamus ac lectus sed magna pharetra auctor sit amet vitae justo. Mauris eu erat tempor, blandit libero nec, aliquet felis. Ut fringilla consequat massa vitae consectetur. Ut eget tortor magna.
                </p>
                <p>
                    Aliquam lectus dui, semper non sem id, fringilla vestibulum tellus. Curabitur congue sagittis feugiat. Nunc et efficitur est. Mauris ut risus nisi. Mauris ultricies orci elit, eu egestas libero vestibulum ut. Ut sed odio enim. Praesent vestibulum at dolor eu blandit. Vivamus vel sagittis sem, sit amet tempor libero. Cras ut condimentum nisl.
                </p>
                <p>
                    Vivamus ultricies mi lorem, ac ullamcorper arcu sodales eu. Phasellus suscipit consequat condimentum. Aliquam a nisl in diam commodo sagittis. Sed sollicitudin est eget felis bibendum, a pretium risus cursus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis rutrum bibendum maximus. Praesent efficitur risus a ornare tincidunt. Morbi finibus, urna vel elementum ultricies, purus est sodales tortor, quis porttitor est ipsum euismod lectus. Sed pharetra, lorem ac vestibulum finibus, felis metus hendrerit nunc, eu ultrices nibh elit ut tellus. Quisque diam urna, dapibus in mattis sit amet, posuere eget lectus. Quisque vitae facilisis lorem. Donec congue rhoncus imperdiet.
                </p>
                <p>
                    Vestibulum in erat non felis congue pulvinar eu a lorem. Fusce sit amet tempor mi. Mauris mattis risus at orci placerat feugiat. Nunc ante tortor, ullamcorper dictum lorem ac, iaculis auctor nibh. In eget nunc tellus. Maecenas congue finibus est eget congue. Cras tincidunt sem eu lectus scelerisque aliquam. Mauris mattis tortor a purus volutpat, vitae tincidunt ante ultrices. Curabitur sed eleifend dolor, ut blandit eros.
                </p>
                <p>
                    Morbi rutrum suscipit arcu quis sagittis. Etiam eu accumsan dui, nec varius lorem. Cras ornare semper accumsan. Quisque at magna sed lacus pretium hendrerit eget non tortor. Cras luctus erat quis sapien maximus, ut hendrerit ex pretium. Nullam libero felis, vehicula a magna eu, ultricies auctor turpis. Morbi non pharetra tortor. Mauris pretium orci vitae lorem sodales iaculis. Duis sed nunc pellentesque quam interdum lacinia sit amet id nisl.
                </p>
                <p>
                    Quisque at sapien sed orci gravida feugiat. Curabitur porta dolor in tortor dictum placerat at quis nibh. Donec posuere luctus mauris, vel ultricies tortor volutpat at. Proin maximus nec turpis et tincidunt. Suspendisse potenti. Maecenas non vehicula sapien. Quisque vehicula lacus ex, in scelerisque dolor venenatis venenatis. Fusce condimentum augue libero, in ultricies nunc rutrum consectetur. Ut fringilla felis ante, ullamcorper molestie lectus gravida sit amet. Proin molestie lacinia porta. Etiam maximus eleifend enim porta posuere. Aenean porttitor gravida risus, vel dictum diam lacinia sed. Etiam mattis ullamcorper vehicula.
                </p>
                <p>
                    Nunc sem elit, consequat at feugiat sed, vulputate sed purus. Suspendisse potenti. Nulla dictum sed dolor at viverra. Phasellus nulla risus, eleifend eu ultrices quis, laoreet accumsan tortor. Morbi elementum magna est, ultricies interdum libero condimentum quis. Nullam gravida quam nisi, sed iaculis justo tempus at. Aliquam turpis lacus, ultrices at sollicitudin sed, varius quis velit. Nunc mauris orci, tempor at felis in, lacinia auctor nibh. Proin lobortis a nunc quis posuere. Nam leo nibh, tempor porta ante id, malesuada placerat odio. Vestibulum non dui a elit posuere gravida quis non lectus. Pellentesque non malesuada lectus, at maximus ligula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.
                </p>
                <p>
                    Maecenas iaculis consequat ex, in porttitor felis commodo non. Cras tristique vulputate nulla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla sed ipsum lectus. Etiam aliquam nulla sit amet nisi ornare, vitae viverra purus cursus. Etiam non enim iaculis, tincidunt tortor vitae, feugiat est. Donec enim arcu, facilisis ut augue et, sollicitudin feugiat purus. Nulla ultricies scelerisque nisi nec pellentesque. Phasellus ac nisi nec est maximus molestie. Sed bibendum purus lorem, eu consectetur felis fringilla sed. Aliquam elementum iaculis justo ac sodales. Praesent sed nisl nec eros condimentum posuere pellentesque sit amet odio. Aliquam imperdiet eleifend lorem, vitae finibus urna laoreet vitae. Nullam sit amet blandit arcu.
                </p>
                <p>
                    Donec porttitor pellentesque ante eu molestie. Aenean malesuada sed nulla eget ullamcorper. Vestibulum quis eleifend justo. Mauris blandit, turpis eget pretium volutpat, sem sapien sodales ante, vel facilisis felis sem vel erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut vestibulum dui a ex rutrum convallis. Proin scelerisque tempus enim, a suscipit ipsum. Pellentesque vestibulum libero non est lobortis facilisis. Integer dui erat, aliquet eu finibus non, congue quis eros. Nunc ut mauris eu nulla luctus convallis. In commodo ligula non sollicitudin facilisis. Sed eu semper velit. Quisque quis sapien vitae metus hendrerit cursus id id neque. Praesent cursus, mi vel tempor rhoncus, leo purus dictum enim, sed dignissim nunc urna a risus.
                </p></div>

        </form>
    </body>
</html>