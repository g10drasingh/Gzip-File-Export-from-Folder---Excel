## CSV.GZ File Reader

This repository contains a Power Query M script that reads CSV files compressed in GZip format from a specified folder and transforms them into tables in Power Query.

### Usage

1. Clone or download this repository to your local machine.

2. Open Power BI Desktop or Excel.

3. In Power BI Desktop or Excel, go to the Power Query Editor.

4. Click on "New Source" and select "Blank Query".

5. Copy the script provided in the `CSV_GZ_File_Reader.m` file in this repository.

6. Paste the script into the query editor.

7. Modify the script to point to the folder containing your CSV.GZ files. Change the value of `"Your Folder Containing CSV.GZ Files"` to the path of your folder.

8. Click on "Done" to execute the script.

9. The script will read all CSV.GZ files from the specified folder, decompress them, and transform them into tables.

10. You can further customize the script as needed for your specific requirements.

### Script Explanation

- **Source**: Retrieves files from the specified folder.
  
- **Filtered Hidden Files**: Filters out hidden files from the source.
  
- **TransformFile**: Defines a function to handle each file's content by decompressing the file content and converting it to a CSV table.
  
- **Invoke Custom Function**: Adds a column with transformed file content by invoking the custom function defined above.
  
- **Removed Other Columns**: Removes unnecessary columns from the table.
  
- **Expanded Table Column**: Expands the table column containing transformed file content.

### Requirements

- Power BI Desktop or Excel with Power Query Editor.

### Author

This script was authored by [G10draSingh].

### License

This project is licensed under the [MIT License](LICENSE).
