from typing_extensions import Unpack
from tf.serving import Params, multipredict
from .reading import read_boxes64

async def batch_predict(from_ply: int, to_ply: int, images_path: str = './images', **p: Unpack[Params]):
  imgs = read_boxes64(plys=range(from_ply, to_ply), images_path=images_path)
  return await multipredict(imgs, **p)