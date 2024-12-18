(ns day-03
  (:gen-class))

(require '[clojure.string :as str]
         '[clojure.set :as sets])

(defn read-file [filename]
  (str/split-lines
   (slurp filename)))

(defn split-string [s]
  (let [len (/ (count s) 2)]
    [(subs s 0 len) (subs s len)]))

(defn set-from [s]
  (set (str/split s #"")))

(defn common [s]
  (let [[s1 s2] (split-string s)]
    (sets/intersection (set-from s1) (set-from s2))))

(defn priority [s]
  (str/index-of "0abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" s))

(defn groups [s]
  (partition 3 s))

(defn badge [g]
  (apply sets/intersection g))

(defn part1 [filename]
  (reduce + (map #(priority (first (seq %)))
                 (map common (read-file filename)))))

(defn part2 [filename]
  (reduce + (map #(priority (first (seq %)))
                 (map badge (groups (map set-from (read-file filename)))))))

(defn -main []
  (printf "day 03 part 1: %d%n" (part1 "../data/03.txt"))
  (printf "day 03 part 2: %d%n" (part2 "../data/03.txt")))
