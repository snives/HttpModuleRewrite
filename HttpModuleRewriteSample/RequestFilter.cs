using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApplication1
{
    class RequestFilter: Stream
    {
        //Temporary buffer to accumulate page reads
        private MemoryStream ms;

        //Handle to original output stream pipeline
        private Stream _stream;

        //Encoding of the response
        private Encoding _encoding;

        //The callback function
        private Func<string, string> _callback;

        /// <summary>
        /// String based callback filter
        /// </summary>
        /// <param name="stream"></param>
        /// <param name="encoding"></param>
        /// <param name="callback"></param>
        public RequestFilter(Stream stream, Encoding encoding, Func<string, string> callback)
        {
            _stream = stream;
            _encoding = encoding;
            _callback = callback;
        }
        
        public override void Flush()
        {
            ms.Flush();
        }

        public override long Seek(long offset, SeekOrigin origin)
        {
            return ms.Seek(offset, origin);
        }

        public override void SetLength(long value)
        {
            ms.SetLength(value);
        }

        public override int Read(byte[] buffer, int offset, int count)
        {
            if (ms == null)
            {
                //I should read stream, execute callback, fill ms.
                var sr = new StreamReader(_stream, _encoding);
                string content = sr.ReadToEnd();

                //Perform the content replacement routine
                content = _callback(content);

                Byte[] bytes = _encoding.GetBytes(content);
                ms = new MemoryStream();
                ms.Write(bytes, 0, bytes.Length);
                ms.Seek(0, SeekOrigin.Begin);
            } else
            {
                //just curious
                var sr = new StreamReader(_stream, _encoding);
                string content = sr.ReadToEnd();
            }

            return ms.Read(buffer, offset, count);
        }

        public override void Write(byte[] buffer, int offset, int count)
        {
            throw new NotSupportedException();
        }

        public override bool CanRead
        {
            get { return true; }
        }

        public override bool CanSeek
        {
            get { return false; }
        }

        public override bool CanWrite
        {
            get { return false; }
        }

        public override long Length
        {
            get { return ms.Length; }
        }

        public override long Position
        {
            get { return ms.Position; }
            set { throw new NotSupportedException(); }
        }
    }
}
