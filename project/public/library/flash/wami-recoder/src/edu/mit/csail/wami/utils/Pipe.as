/* 
* Copyright (c) 2011
* Spoken Language Systems Group
* MIT Computer Science and Artificial Intelligence Laboratory
* Massachusetts Institute of Technology
*
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without
* restriction, including without limitation the rights to use, copy,
* modify, merge, publish, distribute, sublicense, and/or sell copies
* of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
* BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
* ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
* CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*/
package edu.mit.csail.wami.utils
{
        import flash.utils.ByteArray;
        
        /**
         * A pipe is a base class that can be written to, and will 
         * in turn write to a sink.  Overriding "write" and "close"
         * allows a subclass to perform operations on the incoming
         * bytes before passing them on.
         */
        public class Pipe
        {
                private var sink:Pipe = null;
                private var closed:Boolean = false;
                
                public function write(bytes:ByteArray):void
                {
                        if (closed)
                        {
                                throw new Error("Writing to closed pipe");      
                        }
                        
                        if (sink)
                        {
                                sink.write(bytes);
                        }
                }
                
                public function setSink(pipe:Pipe):Pipe 
                {
                        sink = pipe;
                        return sink;
                }

                public function close():void 
                {
                        if (closed)
                        {
                                throw new Error("Pipe already closed");
                        }

                        if (sink) 
                        {
                                sink.close();
                        }
                        
                        closed = true;
                }
                
                public function isClosed():Boolean {
                        return closed;
                }
        }
}

