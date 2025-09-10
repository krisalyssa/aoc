(ns day-07-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-07 :refer [part1 part2]]))

(deftest day-07-test
  (testing "sample data"
    (is (= 0 (part1 "../data/07-sample.txt")))
    (is (= 0 (part2 "../data/07-sample.txt")))))
