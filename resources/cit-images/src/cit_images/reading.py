from typing import Sequence
import base64
import os

def read64(path: str) -> str:
  """Read an image as URL-safe base64"""
  with open(path, 'rb') as f:
    bytes = f.read()
    return base64.urlsafe_b64encode(bytes).decode()
  
def box_path(player: int = 0, ply: int = 0, images_path: str = 'images'):
  """Box path (use with `cit images`)"""
  return os.path.join(images_path, 'boxes', f'boxes-{player}-{ply}.jpg')

def read_boxes(players = range(2), plys = range(8), images_path: str = './images') -> Sequence[Sequence[str]]:
  """Reads boxes, ply-major"""
  plys = list(plys)
  return [
    tuple(box_path(player, ply, images_path) for player in players)
    for ply in plys
  ]

def read_boxes64(players = range(2), plys = range(8), images_path: str = './images') -> Sequence[Sequence[str]]:
  """Reads boxes as base64, ply-major"""
  plys = list(plys)
  return [
    tuple(read64(box_path(player, ply, images_path)) for player in players)
    for ply in plys
  ]
