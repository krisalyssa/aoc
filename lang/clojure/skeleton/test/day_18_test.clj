(ns day-18-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-18 :refer [part1 part2]]))

(deftest day-18-test
  (testing "sample data"
    (is (= 0 (part1 "../data/18-sample.txt")))
    (is (= 0 (part2 "../data/18-sample.txt")))))
