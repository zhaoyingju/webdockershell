using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
 using Docker.DotNet;
using Docker.DotNet.Models;
using System.Threading;

namespace webshell.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        DockerClient client;

        public ValuesController()
        {

            client = new DockerClientConfiguration(
                new Uri("http://localhost:2375"))
                 .CreateClient();
        }
        // GET api/values
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "value1", "value2", "value2" };
        }
        [HttpGet]
        public async Task<string> Post([FromBody] string id)
        {
            var request = new ContainerExecCreateParameters()
            {
                Tty = true,
                AttachStderr = true,
                AttachStdin = true,
                AttachStdout = true,
                Cmd = new List<string>() { "sh" },
                DetachKeys = "ctrl-p,ctrl-q"
            };
            var resp = await client.Exec.ExecCreateContainerAsync(id, request);
            return resp.ID;
        }
        [HttpPut("{id}")]
        public async Task Shell([FromBody] string id)
        {

            var resp = await client.Exec.StartAndAttachContainerExecAsync(id, true);

            while (true)
            {
                string ls = "ls";
                var data = System.Text.Encoding.UTF8.GetBytes(ls);
                await resp.WriteAsync(data, 0, data.Length, default(CancellationToken));
                var ret = await resp.ReadOutputToEndAsync(default(CancellationToken));
                Console.WriteLine(ret.stdout);

            }
        }
    }
}
