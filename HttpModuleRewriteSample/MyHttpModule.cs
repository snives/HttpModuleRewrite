using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class MyHttpModule: IHttpModule
    {
        public void Init(HttpApplication context)
        {
            //Tap into an early event possible in the httpmodule to add a request filter.
            context.BeginRequest += Application_BeginRequest;

            //Tap into the latest event prior to ProcessRequest to add the response filter.
            context.PreRequestHandlerExecute += Application_PreRequestHandlerExecute;
        }

        

        private void Application_BeginRequest(Object source, EventArgs e)
        {
            HttpApplication application = (HttpApplication) source;
            HttpContext context = application.Context;

            if (context.Request.Path.EndsWith(".aspx") && context.Request.HttpMethod == "POST")
            {
                //Sample demonstrating rewriting the request
                var requestCallback = new Func<string, string>(content => {

                    //Read postback form and rewrite the request.
                    var httpValueCollection = HttpUtility.ParseQueryString(content);
                    httpValueCollection["TBUsername"] = httpValueCollection["TBUsername"].ToUpper();

                    return httpValueCollection.ToString();
                });
                context.Request.Filter = new RequestFilter(context.Request.Filter, context.Request.ContentEncoding, requestCallback);
            }
        }

        private void Application_PreRequestHandlerExecute(object source, EventArgs e)
        {
            HttpApplication application = (HttpApplication) source;
            HttpContext context = application.Context;

            //Conditionally replace the response if this is a postback
            if (context.Request.Path.EndsWith(".aspx") && context.Request.HttpMethod == "POST")
            {
                //This is late enough in the pipeline to access the request stream
                var find = context.Request.Form["TBFind"];
                if (!string.IsNullOrEmpty(find))
                {
                    //Sample demonstrating rewriting the response
                    var responseCallback = new Func<string, string>(content => {
                        return content.Replace(find, "<strong>" + find + "</strong>");
                    });
                    context.Response.Filter = new ResponseFilter(context.Response.Filter, context.Response.ContentEncoding, responseCallback);
                }
            }
        }



        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}