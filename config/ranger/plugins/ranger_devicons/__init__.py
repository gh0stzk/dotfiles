import os
import ranger.api
from ranger.core.linemode import LinemodeBase
from .devicons import *

SEPARATOR = os.getenv('RANGER_DEVICONS_SEPARATOR', ' ')

@ranger.api.register_linemode
class DevIconsLinemode(LinemodeBase):
  name = "devicons"

  uses_metadata = False

  def filetitle(self, file, metadata):
    return devicon(file) + SEPARATOR + file.relative_path
