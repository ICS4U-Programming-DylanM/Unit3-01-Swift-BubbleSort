import Foundation

/// A utility class containing bubble sort functionality.
enum BubbleSort {

    /// Sorts an array of integers using the Bubble Sort algorithm.
    ///
    /// - Parameter arr: The array of integers to sort.
    /// - Returns: The sorted array.
    static func bubbleSort(_ arr: [Int]) -> [Int] {
        var numbers = arr
        let count = numbers.count
        
        if count < 2 {
            return numbers
        }
        
        for i in stride(from: count - 1, through: 1, by: -1) {
            for j in 0..<i {
                if numbers[j] > numbers[j + 1] {
                    numbers.swapAt(j, j + 1)
                }
            }
        }
        return numbers
    }
}

/// Main program logic
func main() {
    let inputPath = "input.txt"
    let outputPath = "output.txt"

    do {
        // Read file content
        let content = try String(contentsOfFile: inputPath, encoding: .utf8)
        let lines = content.split(separator: "\n")

        var output = ""

        for line in lines {
            // Split line into string numbers and convert to Int
            let stringParts = line.split(separator: " ")
            let numbers = stringParts.compactMap { Int($0) }

            // Sort numbers
            let sorted = BubbleSort.bubbleSort(numbers)

            // Convert back to a string
            let sortedLine = sorted.map { String($0) }.joined(separator: " ")
            output += sortedLine + "\n"
        }

        // Write output file
        try output.write(toFile: outputPath, atomically: true, encoding: .utf8)
        print("Sorting complete. Output written to \(outputPath).")

    } catch {
        print("Error: \(error)")
    }
}

main()
