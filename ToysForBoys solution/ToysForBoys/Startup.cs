using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ToysForBoys.Startup))]
namespace ToysForBoys
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
