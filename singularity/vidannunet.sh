singularity shell --nv -B /homedtic/aaguado/test_samples/:/home/data/to_predict/pre_vidaa/ -B /homedtic/aaguado/models/:/home/results/nnUNet/3d_fullres/ -B /homedtic/aaguado/output:/output -B /homedtic/aaguado/nnUNet_raw_data:/home/data/nnUNet_raw_data -B /homedtic/aaguado/nnUNet_cropped_data:/home/data/nnUNet_cropped_data -B /homedtic/aaguado/nnUNet_preprocessed:/home/data/nnUNet_preprocessed -B /homedtic/aaguado/prova/:/home/results/predicted/ -C /soft/singularity/vidaannunet:v1.0.5.simg


