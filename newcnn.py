# # coding: utf-8

from tensorflow.keras.preprocessing import image
from tensorflow.keras.models import load_model
import numpy as np


# Function to preprocess the image for prediction
def preprocess_image(image_path):
    # Load the trained model
    loaded_model = load_model("model_new.h5")  # Use the path where you saved your trained model

    img = image.load_img(image_path, target_size=(150, 150))
    img_array = image.img_to_array(img)
    img_array = np.expand_dims(img_array, axis=0)
    img_array /= 255.0  # Normalize the image

    # Make predictions
    predictions = loaded_model.predict(img_array)

    # Map predicted class index to label
    class_labels = ['Astrocitoma','Meduloblastoma','Normal','glioma','Meningioma','notumor','pituitary']
    predicted_class_index = np.argmax(predictions)
    predicted_class_label = class_labels[predicted_class_index]

    print("Predicted Class:", predicted_class_label)
    return predicted_class_label
