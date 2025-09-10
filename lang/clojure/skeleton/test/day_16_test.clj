(ns day-16-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-16 :refer [part1 part2]]))

(deftest day-16-test
  (testing "sample data"
    (is (= 0 (part1 "../data/16-sample.txt")))
    (is (= 0 (part2 "../data/16-sample.txt")))))
