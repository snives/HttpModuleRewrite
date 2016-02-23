using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApplication1
{
    class ResponseFilter: Stream
    {
        //Temporary buffer to accumulate page writes
        private MemoryStream ms;

        //Handle to original output stream pipeline
        private Stream _outputStream;

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
        public ResponseFilter(Stream stream, Encoding encoding, Func<string, string> callback)
        {
            ms = new MemoryStream();
            _outputStream = stream;
            _encoding = encoding;
            _callback = callback;
        }

        public override void Flush()
        {
            if (_callback != null)
            {
                //perform replacement
                string content = _encoding.GetString(ms.GetBuffer());

                //Perform the content replacement routine
                content = _callback(content);

                Byte[] bytes = _encoding.GetBytes(content);
                _outputStream.Write(bytes, 0, bytes.Length);
                _outputStream.Flush();
            }
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
            return ms.Read(buffer, offset, count);
        }

        public override void Write(byte[] buffer, int offset, int count)
        {
            ms.Write(buffer, offset, count);
        }

        public override bool CanRead
        {
            get { return true; }
        }

        public override bool CanSeek
        {
            get { return true; }
        }

        public override bool CanWrite
        {
            get { return true; }
        }

        public override long Length
        {
            get { return ms.Length; }
        }

        public override long Position
        {
            get { return ms.Position; }
            set { ms.Position = value; }
        }
    }
}
