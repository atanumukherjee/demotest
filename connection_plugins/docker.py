import subprocess
from ansible.plugins.connections import ConnectionBase
 
class Connection(ConnectionBase):
 
   @property
    def transport(self):
        """ Distinguish connection plugin. """
        return 'docker'
 
   def _connect(self):
        """ Connect to the container. Nothing to do """
        return self
 
   def exec_command(self, cmd, tmp_path, sudo_user=None, sudoable=False,
                     executable='/bin/sh', in_data=None, su=None,
                     su_user=None):
        """ Run a command within container namespace. """
 
    if executable:
        local_cmd = ["docker", "exec", self._connection_info.remote_addr, executable, '-c', cmd]
    else:
        local_cmd = '%s exec "%s" %s' % ("docker", self._connection_info.remote_addr, cmd)
 
    self._display.vvv("EXEC %s" % (local_cmd), host=self._connection_info.remote_addr)
    p = subprocess.Popen(local_cmd,
        shell=isinstance(local_cmd, basestring),
        stdin=subprocess.PIPE, stdout=subprocess.PIPE,
        stderr=subprocess.PIPE)
 
    stdout, stderr = p.communicate()
    return (p.returncode, '', stdout, stderr)
 
    def put_file(self, in_path, out_path):
        """ Transfer a file from local to container """
        pass
 
    def fetch_file(self, in_path, out_path):
        """ Fetch a file from container to local. """
        pass
 
    def close(self):
        """ Terminate the connection. Nothing to do for Docker"""
        pass
